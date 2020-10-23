n1<-read.csv("https://github.com/COVID19Tracking/associated-data/raw/master/us_census_data/us_census_2018_population_estimates_states.csv")$state

related1<-list()
news1<-list()
projections1<-list()
sentiment1<-list()
media1<-list()

for(i in 1:length(n1)){
  related1[[i]]<-jsonlite::fromJSON(paste0("https://election.ravenpack.com/usdata/1.0/related/related_",n1[i],".json"))[["results"]]
  news1[[i]]<-jsonlite::fromJSON(paste0("https://election.ravenpack.com/usdata/1.0/news/",n1[i],"/news.json"))[["results"]]
  projections1[[i]]<-jsonlite::fromJSON(paste0("https://election.ravenpack.com/usdata/1.0/state/",n1[i],"/ytd/projections.json"))[["results"]]
  sentiment1[[i]]<-jsonlite::fromJSON(paste0("https://election.ravenpack.com/usdata/1.0/state/",n1[i],"/ytd/sentiment.json"))[["results"]]
  media1[[i]]<-jsonlite::fromJSON(paste0("https://election.ravenpack.com/usdata/1.0/state/",n1[i],"/ytd/media.json"))[["results"]]
}

past1<-jsonlite::fromJSON("https://election.ravenpack.com/usdata/1.0/past.json")[["results"]]
polls1<-jsonlite::fromJSON("https://election.ravenpack.com/usdata/1.0/ytd/polls.json")[["results"]]
