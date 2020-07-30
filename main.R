library(dplyr)
library(rvest)

ligas <- c("AR1N",
           "BRA1",
           "CDN1",
           "CLPD",
           "COLP",
           "EL1A",
           "MEX1",
           "PR1A",
           "TDeA",
           "MLS1",
           "URU1",
           "VZ1A")

get_torneo <- function(x) {
  base <- 'https://www.transfermarkt.com/primera-division/startseite/wettbewerb/'
  
  link <- paste0(base, x)
  
  minames <- c("no",
               "Club",
               "Name",
               "Squad",
               "XAge",
               "Foreigners",
               "MV",
               "XMV",
               "no",
               "no",
               "no")
  
  mihtml <- read_html(link)
  
  league <- mihtml %>%
    html_node('h1.spielername-profil') %>%
    html_text()
  
  cntry <- mihtml %>%
    html_nodes('img.flaggenrahmen') %>%
    html_attr("title") %>%
    .[19]
  
  mihtml %>%
    html_node("table.items") %>%
    html_table(fill = T) %>%
    setNames(minames) %>%
    select(-no) %>%
    slice(-1) %>%
    mutate(Foreigners = as.numeric(Foreigners), 
           League = league,
           Country = cntry) %>%  
    select(Country, League, Club, Name, Squad, XAge, Foreigners, MV, XMV)
}

milista <- lapply(ligas, get_torneo)

finalDF <- bind_rows(milista)

write.csv(finalDF, "data/data.csv", row.names = F)

