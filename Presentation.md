Iris data frame - Shiny app
========================================================
author: Juan Flores
date: September 15th, 2017
autosize: true

Overview
========================================================

The objective of the presentation is to show information about the shiny application created.

The data frame Iris is going to be used for a simple analysis, getting a histogram and basic statistic information like the mean and the standard deviation.

Summary of Iris data frame
========================================================


```r
str(iris)
```

```
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

In the shiny app, the user will be able to select a specie, and any other attribute to get basic information about it.

Shiny App
========================================================

The application contains three drop-down lists where the user can select the specie, and the attribute
from the iris data frame, and also the bars color of the histogram.

The drop-down lists, have a default value, so since the moment the user opens the application, a histogram
and the information related to the data of the specie and attrbiute are displayed. Every time the user changes
a value on a drop-down list, the histogram and the information displayed below, will change accordingly.

Glance of the Shiny App
========================================================
![Title](Shiny_app.png)
