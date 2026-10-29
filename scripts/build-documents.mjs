import { execFileSync } from 'node:child_process';
import { copyFileSync, existsSync, lstatSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));
const pdfDirectory = path.join(root, 'sito/public/pdf');
const catalogFile = path.join(root, 'sito/src/data/generated-documents.json');
const sectionsFile = path.join(root, 'sito/src/data/generated-sections.json');
const logoFile = path.join(root, 'sito/public/assets/hex4dev_logo.png');
const compare = (a, b) => a < b ? -1 : a > b ? 1 : 0;
const titleCase = (text) => text.replace(/[-_]+/g, ' ').replace(/\b\p{L}/gu, (letter) => letter.toLocaleUpperCase('it-IT'));
const slugify = (text) => text.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase()
  .replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');

function walk(directory) {
  const absolute = path.join(root, directory);
  if (!existsSync(absolute) || !lstatSync(absolute).isDirectory()) return [];
  return readdirSync(absolute, { withFileTypes: true }).flatMap((entry) => {
    if (entry.name.startsWith('.') || entry.name === 'node_modules') return [];
    const relative = `${directory}/${entry.name}`;
    if (entry.isDirectory()) return walk(relative);
    return entry.isFile() && entry.name.endsWith('.typ') ? [relative] : [];
  });
}

function metadata(sourcePath, rule, captures, override = {}) {
  const date = override.date !== undefined ? override.date : captures.date ?? null;
  if (date !== null && (!/^\d{4}-\d{2}-\d{2}$/.test(date) || new Date(`${date}T00:00:00Z`).toISOString().slice(0, 10) !== date)) {
    throw new Error(`Data non valida per ${sourcePath}: ${date}`);
  }
  const values = {
    ...captures, date: date ?? '', dateIT: date ? date.split('-').reverse().join('/') : '',
    categoryTitle: titleCase(captures.category ?? ''), slugTitle: titleCase(captures.slug ?? ''),
    sourcePath, root: rule.root,
  };
  const field = (name, fallback) => (rule[`${name}Template`] ?? rule[name] ?? fallback)
    .replace(/\{(\w+)\}/g, (_, key) => {
      if (!(key in values)) throw new Error(`Segnaposto sconosciuto: {${key}}`);
      return values[key];
    });
  const category = override.category ?? field('category', titleCase(captures.category ?? rule.root));
  const pdfPath = field('pdf', `pdf/${sourcePath.replace(/\.typ$/, '.pdf')}`);
  if (!pdfPath.startsWith('pdf/') || pdfPath.includes('\\') || pdfPath.split('/').some((part) => !part || part === '.' || part === '..')) {
    throw new Error(`Percorso PDF non valido: ${pdfPath}`);
  }
  return {
    section: override.section ?? rule.section,
    id: slugify(field('id', sourcePath.replace(/\.typ$/, ''))),
    title: override.title ?? field('title', titleCase(captures.slug ?? path.posix.basename(sourcePath, '.typ'))),
    category, type: override.type ?? field('type', slugify(category)), date, sourcePath, pdfPath,
    order: override.order ?? Infinity,
  };
}

function discover(config) {
  const rules = config.rules.map((rule) => {
    if (!/^[^./\\][^/\\]*$/.test(rule.root) || ['assets', 'templates', 'sito', 'node_modules'].includes(rule.root)) {
      throw new Error(`Root di pubblicazione non consentita: ${rule.root}`);
    }
    if (!rule.match.startsWith('^') || !rule.match.endsWith('$')) throw new Error(`Pattern non ancorato: ${rule.match}`);
    return { ...rule, pattern: new RegExp(rule.match) };
  });
  const files = [...new Set(rules.map((rule) => rule.root))].flatMap(walk).sort(compare);
  const documents = [];
  const ids = new Set();
  const pdfs = new Set();
  for (const sourcePath of files) {
    const matches = rules.flatMap((rule) => {
      const match = sourcePath.startsWith(`${rule.root}/`) && rule.pattern.exec(sourcePath);
      return match ? [{ rule, captures: match.groups ?? {} }] : [];
    });
    if (matches.length > 1) throw new Error(`Più regole corrispondono a ${sourcePath}`);
    const override = config.overrides?.[sourcePath] ?? {};
    if (!matches.length || override.visible === false) continue;
    const { rule, captures } = matches[0];
    const document = metadata(sourcePath, rule, captures, override);
    if (ids.has(document.id) || pdfs.has(document.pdfPath)) throw new Error(`ID o PDF duplicato: ${sourcePath}`);
    ids.add(document.id);
    pdfs.add(document.pdfPath);
    documents.push(document);
  }
  return documents.sort((a, b) => compare(b.date ?? '', a.date ?? '') || a.order - b.order
    || compare(a.title, b.title) || compare(a.sourcePath, b.sourcePath));
}

function clean() {
  rmSync(pdfDirectory, { recursive: true, force: true });
  rmSync(catalogFile, { force: true });
  rmSync(sectionsFile, { force: true });
}

function build() {
  const config = JSON.parse(readFileSync(path.join(root, 'scripts/publications.config.json'), 'utf8'));
  if (!Array.isArray(config.sections) || !config.sections.length) throw new Error('Definire almeno una sezione in publications.config.json.');
  const sectionIds = new Set();
  for (const section of config.sections) {
    if (!section.id || !section.title || sectionIds.has(section.id)) throw new Error(`Sezione non valida o ID duplicato: ${section.id}`);
    sectionIds.add(section.id);
  }
  if (!sectionIds.has(config.defaultSection)) throw new Error(`Sezione predefinita non definita: ${config.defaultSection}`);
  for (const rule of config.rules) if (!sectionIds.has(rule.section)) throw new Error(`Sezione non definita nella regola: ${rule.section}`);
  const documents = discover(config);
  clean();
  if (!documents.length) throw new Error('Nessun documento corrisponde alle regole di pubblicazione.');
  for (const document of documents) {
    const output = path.join(root, 'sito/public', document.pdfPath);
    mkdirSync(path.dirname(output), { recursive: true });
    try {
      execFileSync('typst', ['compile', '--root', '.', document.sourcePath, output], { cwd: root, stdio: 'inherit' });
    } catch (error) {
      throw new Error(error.code === 'ENOENT' ? 'Typst non disponibile nel PATH: installa la versione 0.15.1.'
        : `Compilazione fallita: ${document.sourcePath}`, { cause: error });
    }
    const info = lstatSync(output);
    if (!info.isFile() || info.size === 0) throw new Error(`PDF mancante o vuoto: ${document.sourcePath}`);
  }
  mkdirSync(path.dirname(logoFile), { recursive: true });
  copyFileSync(path.join(root, 'assets/hex4dev_logo.png'), logoFile);
  mkdirSync(path.dirname(catalogFile), { recursive: true });
  const catalog = documents.map(({ order, ...document }) => document);
  writeFileSync(catalogFile, `${JSON.stringify(catalog, null, 2)}\n`);
  writeFileSync(sectionsFile, `${JSON.stringify({ defaultSection: config.defaultSection, sections: config.sections }, null, 2)}\n`);
  console.log(`${catalog.length === 1 ? 'Generato 1 documento' : `Generati ${catalog.length} documenti`}.`);
}

try {
  build();
} catch (error) {
  clean();
  console.error(`Errore build documenti: ${error.message}`);
  process.exitCode = 1;
}
