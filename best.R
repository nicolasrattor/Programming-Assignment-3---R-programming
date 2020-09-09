

best <- function(state, outcome) {
  ## Read outcome data
  base <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  if(!state %in% base$State){
    print("invalid state")
  } else if (!outcome %in% c("heart attack","heart failure","pneumonia")) {
    print("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  else if(outcome %in% c("heart attack")){
    a<-base %>% mutate(attack=as.numeric(as.character(Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))) %>% 
      filter(!is.na(attack)&State==state) %>% select(State,Hospital.Name,attack) %>% arrange(attack,Hospital.Name) 
    print(a[1,])
  }
  
  else if(outcome %in% c("heart failure")){
    b<-base %>% mutate(failure=as.numeric(as.character(Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))) %>% 
      filter(!is.na(failure)&State==state) %>% select(State,Hospital.Name,failure) %>% arrange(failure,Hospital.Name) 
    print(b[1,])
  }
  
  else if (outcome %in% c("pneumonia")){
    c<-base %>% mutate(pneumonia=as.numeric(as.character(Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))) %>% 
      filter(!is.na(pneumonia)&State==state) %>% select(State,Hospital.Name,pneumonia) %>% arrange(pneumonia,Hospital.Name) 
    print(c[1,])
  }

}
