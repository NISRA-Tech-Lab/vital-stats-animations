transform_URL <- function(URL) {
  
  URL %>%
    gsub(" ", "", .) %>%
    gsub('"', "%22", .) %>%
    gsub("\\{", "%7B", .) %>%
    gsub("\\}", "%7D", .) %>%
    gsub("\\[", "%5B", .) %>%
    gsub("\\]", "%5D", .) %>%
    gsub("\\n", "", .) %>%
    gsub("\\t", "", .)
  
}

json_data_from_rpc <- function (query) {
  jsonlite::fromJSON(
    txt = transform_URL(paste0(
      'https://ws-data.nisra.gov.uk/public/api.jsonrpc?data=',
      query))
  )$result
}