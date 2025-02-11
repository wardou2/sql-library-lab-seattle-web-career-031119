def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  INNER JOIN series
  ON series.id == books.series_id
  WHERE series.id = (
	SELECT MIN(series.id) FROM series)"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  WHERE characters.motto =  (
	SELECT MIN(characters.motto) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
  FROM characters
  WHERE characters.species =  (
	SELECT MAX(characters.species) FROM characters)"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series ON series.author_id = authors.id
  JOIN subgenres ON subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  INNER JOIN characters ON characters.series_id = series.id
  GROUP BY characters.species
  HAVING characters.species ='human'"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.id)
  FROM characters
  JOIN character_books ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY COUNT(character_books.id) DESC"
end
