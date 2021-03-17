#### DataVis-ggplot-follow.R
#### author: Trevor Faske
#### date modified: 03/16/2021

#This is a follow along for DataVis-ggplot-primer located:
#https://github.com/juliema/Data_Science_For_Biology_II/tree/Spring_21/Part.3_DataVisualization/1-ggplot

#install packages
install.packages(c('tidyverse','ggforce','ggsci','patchwork','Hmisc'))

#import libraries
library(tidyverse)
library(ggforce) 
library(ggsci)
library(patchwork)
library(Hmisc)

#set working directory
#CHANGE TO YOURS
#setwd('~/g/DataScience/Data_Science_For_Biology_II/Part.3_DataVisualization/1-ggplot')
setwd('~/g/Classes/DataScience/data_vis/')

#read in dataset
city_df <- read.csv('city_df.csv')

#look at structure 
str(city_df)

#Understanding factors
as.character(city_df$State)
as.numeric(city_df$State)
levels(city_df$State)

#basic ggplot layout 
ggplot(data=city_df,aes(x=Time,y=Growth))

######################################################################
              #### scatterplot ####
######################################################################

ggplot(data=city_df,aes(x=Time,y=Growth)) + 
  geom_point()

#scatter colored by state
ggplot(data=city_df,aes(x=Time,y=Growth,color=State)) + 
  geom_point()

#add line for each state
ggplot(data=city_df,aes(x=Time,y=Growth,color=State)) + 
  geom_point() + 
  geom_line()

#add trendline
ggplot(data=city_df,aes(x=Time,y=Growth,colour=State)) + 
geom_point() + 
  stat_smooth()

#if we didnt want to add a line for each state and one overall trendline, 
#we would store the colors within the layer we want them (aka point)
ggplot(data=city_df,aes(x=Time,y=Growth)) + 
  geom_point(aes(colour=State)) + 
  stat_smooth()

#options for change lines to look nicer
ggplot(data=city_df,aes(x=Time,y=Growth)) + 
  geom_point(aes(colour=State),size=3) + 
  stat_smooth(linetype='dashed',colour='black',size=2)

#add shape for population size
ggplot(data=city_df,aes(x=Time,y=Growth)) + 
  geom_point(aes(colour=State,shape=Size),size=4) + 
  stat_smooth(linetype='dashed',colour='black',size=2)

#repurpose your code for similar layouts by just changing the variable
#lat vs Ppt
ggplot(data=city_df,aes(x=Lat,y=Ppt)) + 
  geom_point(aes(colour=State,shape=Size),size=4) + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2)

#lat vs Temp
ggplot(data=city_df,aes(x=Lat,y=Temp)) + 
  geom_point(aes(colour=State,shape=Size),size=4) + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2)

#Temp vs Ppt
ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(colour=State,shape=Size),size=4) + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2)

######################################################################
                      #### Categorical Data ####
######################################################################

### using the base functions, we need to summarize the data ###

city_sum_df <- city_df %>%
  group_by(State) %>%
  summarise(Temp_mean = mean(Temp, na.rm = TRUE), #temp mean
            Temp_sd = sd(Temp, na.rm = TRUE), #temp standard deviation
            Temp_n = n(), #temp count
            Ppt_mean = mean(Ppt, na.rm = TRUE), #Ppt mean
            Ppt_sd = sd(Ppt, na.rm = TRUE),  #Ppt standard deviation
            Ppt_n = n()) %>% #Ppt count 
  mutate(Temp_se = Temp_sd / sqrt(Temp_n), #Temp standard error
         Temp_lower.ci = Temp_mean - qt(1 - (0.05 / 2), Temp_n - 1) * Temp_se, #Temp lower 95% confidence interval
         Temp_upper.ci = Temp_mean + qt(1 - (0.05 / 2), Temp_n - 1) * Temp_se, #Temp upper 95% confidence interval
         Ppt_se = Ppt_sd / sqrt(Ppt_n), #Ppt standard error
         Ppt_lower.ci = Ppt_mean - qt(1 - (0.05 / 2), Ppt_n - 1) * Ppt_se, #Ppt lower 95% confidence interval
         Ppt_upper.ci = Ppt_mean + qt(1 - (0.05 / 2), Ppt_n - 1) * Ppt_se) #Ppt upper 95% confidence interval

city_sum_df

### this is wide, make long ###
# do this by doing Temp and Ppt separate and rbind()

Temp_sum_df <- city_df %>%
  group_by(State) %>%
  summarise(mean = mean(Temp, na.rm = TRUE), #temp mean
            sd = sd(Temp, na.rm = TRUE), #temp standard deviation
            n = n()) %>% #temp count
  mutate(se = sd / sqrt(n), #Temp standard error
         ci = 1.96 * se) #Temp 95% confidence interval
Temp_sum_df$Clim <- 'Temp'

Ppt_sum_df <- city_df %>%
  group_by(State) %>%
  summarise(mean = mean(Ppt, na.rm = TRUE), #Ppt mean
            sd = sd(Ppt, na.rm = TRUE), #Ppt standard deviation
            n = n()) %>% #Ppt count
  mutate(se = sd / sqrt(n), #Ppt standard error
         ci = 1.96*se) #Ppt 95% confidence interval
Ppt_sum_df$Clim <- 'Ppt'

city_sum_df <- rbind(Temp_sum_df,Ppt_sum_df)
city_sum_df

#### Catergorical graphs ####

#barchart 
ggplot(data=city_sum_df,aes(x=State,y=mean)) +
  geom_bar(stat='identity') 

#see both Temp/Ppt using fill
ggplot(data=city_sum_df,aes(x=State,y=mean,fill=Clim)) +
  geom_bar(stat='identity')

#also didn't work because we need to set geom_bar(position)
ggplot(data=city_sum_df,aes(x=State,y=mean,fill=Clim)) +
  geom_bar(stat='identity',position='dodge')

#instead of dodging, lets make different panels
#setting scales='free' allows different y axes scales
ggplot(data=city_sum_df,aes(x=State,y=mean,fill=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') + 
  geom_bar(stat='identity')

#manually add error bars
ggplot(data=city_sum_df,aes(x=State,y=mean,fill=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') + 
  geom_bar(stat='identity') +
  geom_errorbar(aes(ymin = mean - ci, ymax = mean + ci))

#using points instead of bars
ggplot(data=city_sum_df,aes(x=State,y=mean,colour=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') + 
  geom_point(size=5) + 
  geom_errorbar(aes(ymin = mean - ci, ymax = mean + ci),colour='black')

#### That took a lot of work to summarize ####
#### let's use built in ggplot functions instead ####

#still need to make long data for temp and ppt
city_long_df <- city_df %>% 
  gather(key=Clim,value=mean,c(Ppt,Temp))

#make same point and error but using stat_summary()
ggplot(data=city_long_df,aes(x=State,y=mean,fill=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black')

#make same point and error bar but using stat_summary()
ggplot(data=city_long_df,aes(x=State,y=mean,colour=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black') + 
  stat_summary(fun = mean, geom = "point",size=5) 

#### while this is easier, this style of figure can be misleading ####
#make figures that show the full distribution of data

#boxplot
ggplot(data=city_long_df,aes(x=State,y=mean,fill=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_boxplot()

#violin plot
ggplot(data=city_long_df,aes(x=State,y=mean,fill=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_violin(draw_quantiles = 0.5)

#show raw data with mean and CI
ggplot(data=city_long_df,aes(x=State,y=mean,colour=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_point(size=4) +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black') + 
  stat_summary(fun = mean, geom = "point",size=5,colour='black') 

#same figure but points jittered in shape of densities
ggplot(data=city_long_df,aes(x=State,y=mean,colour=Clim)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_sina(size=3) +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black') + 
  stat_summary(fun = mean, geom = "point",size=5,colour='black') 

######################################################################
                #### Figure customization ####
######################################################################

#### factors ####
levels(city_df$State)

#change order and to full names, create new column
city_df$State_name <- factor(city_df$State,levels=c('WA','OR','CA','NV','AZ'),
                             labels=c('Washington','Oregon','California','Nevada','Arizona'))
levels(city_df$State_name)

#make figure to show change, notice legend
ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(colour=State_name),size=4) + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2)

#### change axis labels and add title ####
ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(colour=State_name),size=4) + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  xlab('Temperature') + ylab('Precipitation') + 
  ggtitle('Temp vs. Precip. by State')

#### Change colour and fill ####
# colour = points, lines, text, borders
# fill = anything with area (can be empty points)

#pch to change point shape to be filled
#21-25 are empty points of various shapes

ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(fill=State_name),size=4,pch=21,colour='black') + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  xlab('Temperature') + ylab('Precipitation') + 
  ggtitle('Temp vs. Precip. by State')


######################################################################
                #### Scale ####
######################################################################

#look at the primer for detailed descriptions

#### all in one figure, change: ####
# change fill colours manually
# change shape of each state
# change axes labels, limits, breaks, and position = top

ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(fill=State_name,shape=State_name),size=4,colour='black') + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  ggtitle('Temp vs. Precip. by State') + 
  scale_fill_manual(name='State:',values=c('red','blue','yellow','green','grey70')) + 
  scale_shape_manual(name='State:',values=c(21,22,23,24,25)) + 
  scale_x_continuous(name='Temperature',limits=c(5,25),breaks=c(5,10,15,20,25),position = 'top') + 
  scale_y_continuous(name='Precipitation',limits=c(0,1500),breaks=c(0,250,500,1000,1250,1500)) 


######################################################################
                      #### Theme ####
######################################################################

#changes figure layout, see primer for more info 

#### standard themes ####
#theme_bw()
ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(fill=State_name,shape=State_name),size=4,colour='black') + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  ggtitle('Temp vs. Precip. by State') + 
  scale_fill_manual(name='State:',values=c('red','blue','yellow','green','grey70')) + 
  scale_shape_manual(name='State:',values=c(21,22,23,24,25)) + 
  scale_x_continuous(name='Temperature',limits=c(5,25),breaks=c(5,10,15,20,25)) + 
  scale_y_continuous(name='Precipitation',limits=c(0,1500),breaks=c(0,250,500,1000,1250,1500)) + 
  theme_bw()

#theme_classic()
ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(fill=State_name,shape=State_name),size=4,colour='black') + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  ggtitle('Temp vs. Precip. by State') + 
  scale_fill_manual(name='State:',values=c('red','blue','yellow','green','grey70')) + 
  scale_shape_manual(name='State:',values=c(21,22,23,24,25)) + 
  scale_x_continuous(name='Temperature',limits=c(5,25),breaks=c(5,10,15,20,25)) + 
  scale_y_continuous(name='Precipitation',limits=c(0,1500),breaks=c(0,250,500,1000,1250,1500)) + 
  theme_classic()

#### SO MANY OPTIONS ####
#this will change as you find what you like and needed for each figure
#here is just one I commonly start with then edit as needed 

ggplot(data=city_df,aes(x=Temp,y=Ppt)) + 
  geom_point(aes(fill=State_name,shape=State_name),size=4,colour='black') + 
  stat_smooth(method='lm',linetype='dashed',colour='black',size=2) + 
  #ggtitle('Temp vs. Precip. by State') + #titles always kinda look bad
  scale_fill_npg(name='State:') + 
  scale_shape_manual(name='State:',values=c(21,22,23,24,25)) + 
  scale_x_continuous(name='Temperature') + 
  scale_y_continuous(name='Precipitation',limits=c(0,1500),breaks=c(0,250,500,750,1000,1250,1500)) + 
  theme_bw() +
  theme(legend.position = 'bottom', 
        plot.title = element_text(size = 20, colour="black",face = "bold"),
        axis.text = element_text(size=13),
        axis.title = element_text(size = 16, colour="black",face = "bold"),
        panel.border = element_rect(size = 1.5, colour = "black"),
        legend.title = element_text(size = 16, colour="black",face = "bold",vjust = 1),
        legend.text = element_text(size=13),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


######################################################################
                      #### Patchwork ####
######################################################################
#combining multiple figures

#multiple ways to do this but this is the easiest
# ggarrange in library(ggpubr) is my preferred package

#### For this, we need to assign plots to variables to use later ####

#worst
worst_plot <- ggplot(data=city_sum_df,aes(x=State,y=mean,fill=Clim)) +
  geom_bar(stat='identity',position='dodge') + 
  ggtitle('Worst') + 
  theme(plot.title = element_text(size = 20, colour="black",face = "bold"))
worst_plot

#very_bad
very_bad_plot <- ggplot(data=city_long_df,aes(x=State,y=mean,fill=State)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black') + 
  scale_fill_npg() + 
  ggtitle('Very bad') + 
  theme(legend.position='none',
        plot.title = element_text(size = 20, colour="black",face = "bold"))
very_bad_plot

#bad plot
bad_plot <- ggplot(data=city_long_df,aes(x=State,y=mean,fill=State)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_boxplot() + 
  scale_fill_npg() + 
  ggtitle('eh, bad') + 
  theme(legend.position='none',
        plot.title = element_text(size = 20, colour="black",face = "bold"))
bad_plot

#okay plot 
okay_plot <- ggplot(data=city_long_df,aes(x=State,y=mean,fill=State)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_sina(size=4,pch=21) +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black') + 
  stat_summary(fun = mean, geom = "point",size=5,colour='black') +
  ggtitle('Okay') + 
  theme(legend.position='none',
        plot.title = element_text(size = 20, colour="black",face = "bold"))
okay_plot

#### patchwork: 2 rows and 2 columns ####
worst_plot + very_bad_plot + bad_plot + okay_plot + plot_layout(ncol=2,nrow=2)

#### patchwork 2 col, 1 row ####
better_plot <- ggplot(data=city_long_df,aes(x=State,y=mean,,fill=State)) +
  facet_wrap(~Clim,nrow=1,scales = 'free') +
  geom_sina(size=4,pch=21) +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black',width = 0.3,size=1.4) + 
  stat_summary(fun = mean, geom = "point",size=7,colour='black',pch=22,fill='white') +
  scale_fill_npg() + 
  ggtitle('Better') + 
  theme_bw() +
  theme(legend.position = 'None', 
        plot.title = element_text(size = 26, colour="black",face = "bold"),
        axis.text = element_text(size=18),
        axis.title = element_text(size = 22, colour="black",face = "bold"),
        panel.border = element_rect(size = 1.5, colour = "black"),
        legend.title = element_text(size = 22, colour="black",face = "bold",vjust = 1),
        legend.text = element_text(size=18),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.text.x = element_text(size=22, face="bold"),
        strip.background = element_rect(size=1.5,colour="#333333",fill="#CCCCCC"))
better_plot

okay_plot + better_plot

#### sometimes its nicer to combine two figures into one ####
#### good one instead of using facet_wrap ####

temp_df <- city_long_df[which(city_long_df$Clim == 'Temp'),]
temp_plot <- ggplot(data=temp_df,aes(x=State,y=mean,fill=State)) +
  geom_sina(size=6,pch=21,colour='black') +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black',width = 0.3,size=1.4) + 
  stat_summary(fun = mean, geom = "point",size=9,colour='black',pch=22,fill='white') +
  scale_fill_npg() + 
  ylab('Temperature') + 
  theme_bw() +
  theme(legend.position = 'None', 
        plot.title = element_text(size = 26, colour="black",face = "bold"),
        axis.text = element_text(size=18),
        axis.title = element_text(size = 22, colour="black",face = "bold"),
        axis.title.x = element_blank(),
        panel.border = element_rect(size = 1.5, colour = "black"),
        legend.title = element_text(size = 22, colour="black",face = "bold",vjust = 1),
        legend.text = element_text(size=18),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
temp_plot

ppt_df <- city_long_df[which(city_long_df$Clim == 'Ppt'),]
ppt_plot <- ggplot(data=ppt_df,aes(x=State,y=mean,fill=State)) +
  geom_sina(size=6,pch=21,colour='black') +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar",color='black',width = 0.3,size=1.4) + 
  stat_summary(fun = mean, geom = "point",size=9,colour='black',pch=22,fill='white') +
  scale_fill_npg() + 
  scale_y_continuous(name='Precipitation',position='right',breaks=c(250,500,750,1000,12)) + 
  theme_bw() +
  theme(legend.position = 'None', 
        plot.title = element_text(size = 26, colour="black",face = "bold"),
        axis.text = element_text(size=18),
        axis.title = element_text(size = 22, colour="black",face = "bold"),
        axis.title.x = element_blank(),
        panel.border = element_rect(size = 1.5, colour = "black"),
        legend.title = element_text(size = 22, colour="black",face = "bold",vjust = 1),
        legend.text = element_text(size=18),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
ppt_plot

temp_plot + ppt_plot

#### let's look at it next to the worst plot ####
#### remember, this is the same exact data showing mostly the same thing ####

worst_plot + temp_plot + ppt_plot


