json.articles @articles do |article|
  json.id   article.id
  json.title article.title
  json.author article.author
end