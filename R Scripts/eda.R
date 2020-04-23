library(dplyr)
library(ggplot2)
require(gridExtra)

# Remove missing date
df <- read.csv("./data/data.csv", header = TRUE)
df <- df[complete.cases(df), ]

a = ggplot(df, aes(x=R_avg_GROUND_att)) +
  geom_density(alpha=.2, fill="#FF6666") + 
  theme_bw() + xlab("Average Attempted Ground Attacks by Red Fighter") + ylab("Frequency")

b = ggplot(df, aes(x=R_avg_HEAD_att)) +
  geom_density(alpha=.2, fill="#FF6666") + 
  theme_bw() + xlab("Average Attempted Head Attacks by Red Fighter") + ylab("Frequency")

c = ggplot(df, aes(x=R_avg_SIG_STR_pct)) +
  geom_density(alpha=.2, fill="#FF6666") + 
  theme_bw() + xlab("Average Significant Strike Percentage by Red Fighter") + ylab("Frequency")

grid.arrange(a, b, c, nrow = 3)
