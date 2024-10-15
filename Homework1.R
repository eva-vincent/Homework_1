#Importing the dataset
bonds <- read.csv('Homework1_Bonds.csv')

#1. Bonds approved and defeated by voters
table(bonds$Result)
#1 Differences in rates of approved bonds across government types
prop.table(table(bonds$Type,bonds$Result), margin=1)

#2 New Variable
bonds$Vote_Total<- bonds$VotesFor + bonds$VotesAgainst
#2 Highest voter turnout
bonds[which.max(bonds$Vote_Total),]

#3 Create subset of approved with at least 100 votes
HighApproved <- bonds[(bonds$Result=='Carried') & (bonds$Vote_Total>=100),]
#3 Variable for percentage of total votes for
HighApproved$Percent_For<- (HighApproved$VotesFor/HighApproved$Vote_Total)*100
#3 Graph of distribution
boxplot(HighApproved$Percent_For,main='Boxplot of Percentage Approval',xlab='Percentage of approved votes', pch=20, horizontal=TRUE)
#3 Description of distribution
summary(HighApproved$Percent_For)

#4 Relation of margin bond approved to cost
plot(HighApproved$Amount/1000,HighApproved$Percent_For,main='Percentage approval vs. Cost',xlab='Cost of Bond (in thousands of dollars)',ylab='Percentage of Approved Votes',pch=20, xlim = c(0,1000000))
cor(HighApproved$Amount,HighApproved$Percent_For)
