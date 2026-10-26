const encode = (segment) => encodeURIComponent(segment).replace(/[!'()*]/g, (char) =>
  `%${char.charCodeAt(0).toString(16).toUpperCase()}`,
);
const encodePath = (value) => String(value).split('/').map(encode).join('/');
const normalizeBase = (base) => `/${String(base ?? '').split('/').filter(Boolean).join('/')}/`;

export function siteUrl(path, base = import.meta.env.BASE_URL) {
  const relative = String(path ?? '').replace(/^\/+|\/+$/g, '');
  return `${normalizeBase(base)}${relative ? encodePath(relative) : ''}`;
}

export function sourceUrl(path) {
  return `https://github.com/hex4dev/docs/blob/main/${encodePath(path)}`;
}
