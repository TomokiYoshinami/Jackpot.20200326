#-------------------------------------
# mean
#-------------------------------------
subject.means <- d %>%
    group_by(data2$Race.TrackTypeCd, data2$Race.JyuryoCd, data2$Race.JyokenCd5, data2$Race.JyoCd,Odds1ByWin.BetCount,Odds1ByWin.TotalBetCount) %>%
    summarize(prop = mean(pronoun))
condition.means <- subject.means %>%
    group_by(data2$Race.JyuryoCd, data2$Race.JyokenCd5, data2$Race.JyoCd) %>%
    summarize(mean = mean(prop),
              se   = sd(prop)/sqrt(n()))
ggplot(condition.means, aes(x=interaction(data2$Race.JyuryoCd, data2$Race.JyoCd), fill=factor(data2$Race.JyokenCd5), y=mean)) +
  geom_bar(stat="identity", pos="dodge", colour="black") +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), size=.5, width=.2, position=position_dodge(.9)) +
  ylim(c(0,1)) +
  theme_bw(base_size=12) +
  ylab("Proportion of pronouns")