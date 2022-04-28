#flatten_json function; written by a Zooniverse user and modified by ELB

#Takes a data frame with json_data in it and flattens the json column
#now flatten data to relevant tasks within a classification
flatten_is_there_animal_annotations<-function(json_data){
  flat_to_task<-json_data %>%
    select(., classification_id, user_name, subject_ids,   workflow_version, annotations) %>%
    as.tbl_json(json.column = "annotations") %>%
    gather_array(column.name = "task") %>%  #really important for joining later
    enter_object %>%
      spread_all


#now get rid of .filter columns
  flat_to_task<-flat_to_task %>% select(! starts_with("filters."))
  return(flat_to_task)
}