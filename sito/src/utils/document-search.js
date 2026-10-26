export function matchesDocumentSearch(searchText, category, query, selectedCategory = 'all') {
  const normalizedQuery = String(query ?? '').trim().toLocaleLowerCase('it-IT');
  const normalizedSearchText = String(searchText ?? '').toLocaleLowerCase('it-IT');
  const matchesCategory = selectedCategory === 'all' || category === selectedCategory;
  return matchesCategory && normalizedSearchText.includes(normalizedQuery);
}
