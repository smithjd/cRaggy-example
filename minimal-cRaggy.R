#' Minimal cRaggy example
#' John David Smith - john.smith@learningalliances.net - Twitter / github: smithjd
#'
#' See visualizations here: https://www.biketownpdx.com/system-data
#'
library(tidyverse)

url <- "https://s3.amazonaws.com/biketown-tripdata-public/BiketownPublicTripData201804.zip"

download.file(url, dest = "dataset.zip", mode = "wb")

unzip("dataset.zip", exdir = "./")

public_trip_data <- list.files(
  path = "PublicTripData",
  pattern = "*.csv",
  full.names = T ) %>%
  # map_df(~ read_csv(., col_types = cols(.default = "c")))
  map_df(~ read_csv(., col_types = "iccddDTcddDTcicdTcl"))

str(public_trip_data)

ggplot(public_trip_data,
       aes(x = PaymentPlan, col = MultipleRental)) +
  geom_bar(position = "dodge")

# file.remove("dataset.zip") # other cleanup
