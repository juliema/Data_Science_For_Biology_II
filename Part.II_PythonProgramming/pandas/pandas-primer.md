# pandas - Python data analysis library

**Author: Trevor Faske  
Modified: 02/28/2021**

pandas is a must learn tool for data science. It is a powerful python package and swiss army knife for all data analysis. "The name is derived from the term 'panel data', an econometrics term for data sets that include observations over multiple time periods for the same individuals. Also a play on the phrase 'Python data analysis.'" - wikipedia

pandas works with the data structure called **DataFrame** (same as in R). This consists of a matrix with rows and columns and will very similar to an excel spreadsheet or csv file. pandas allows you to easily manipulate, filter, summarize, and merge data for downstream processing. pandas is part of the SciPy (https://www.scipy.org/) ecosystem so works great for plotting and data analysis. 

## Resources

- https://github.com/jvns/pandas-cookbook
- https://www.w3schools.com/python/ (great NumPy intro)
- https://pandas.pydata.org/docs/getting_started/tutorials.html (community tutorials)
- https://pandas.pydata.org/docs/user_guide/index.html

## Installing libraries

Python is extremely efficient and only has a few commands loaded and installed from the beginning. There are libraries we will have to install and import as needed to use. 

Everyone should have pip3 or conda available and these commands will be used to install needed libraries from the terminal. 

**If using pip3**:  

`$ pip3 install numpy`   
`$ pip3 install pandas`
    
You might get a permissions error. If so, install like:  
`$ pip3 install --user pandas`

**If using conda**:  

`$ conda install -c anaconda numpy`  
`$ conda install -c anaconda pandas`


## Importing libraries

Python only has a few base commands and is extremely effecient. Libraries must be imported before use to make the commands available. There is a few ways to import libraries by creating aliases or only accessing paticular functions within libraries. 

Basic import: 

`import numpy`  
`import pandas`  


Examples of more common ways of importing:  

`import numpy,pandas` #import multiple libraries in single line  
`import numpy as np` #import package as alias  
`from pandas import DataFrame` #import only specific function from library

Common aliases you will see when searching issues:  

`import numpy as np`  
`import pandas as pd`

## Getting started with NumPy

#### Resource: https://www.w3schools.com/python/numpy_intro.asp

NumPy is a popular array – processing package of Python that also does a lot of mathmatical processes. Everything is array/matrix based and works faster than a list. pandas uses many of this same syntax so might be useful to know a few commands!

### ndarrays

import numpy


```python
import numpy as np 
```

    [1 3 5 2 4 6]





    numpy.ndarray



#### create 1-D array


```python
d1 = np.array([1,3,5,2,4,6])
print(d1)
type(d1)
```

#### create 2-D array


```python
d2 = np.array([[1,3,5],[2,4,6]])
print(d2)
```

    [[1 3 5]
     [2 4 6]]


#### get dimensions and total size


```python
print(d2.shape) #rows, columns
print(d2.size) 
```

    (2, 3)
    6


### Accessing and indexing arrays work very similar to lists but with added dimension. Very similar to R indexing 

array[row,column] #REMEMBER starts at 0


```python
# 2nd row, 1st column 
print(d2[1,0]) 

# 1st row, 3rd column
print(d2[0,2])
```

    2
    5


#### Slicing works very similarly to lists


```python
#extract first 2 elements of the 2nd row
print(d2[1,:2])
```

    [2 4]


### arange and reshape array format


```python
d1 = np.array([1,3,5,2,4,6])
d1.reshape(2,3)
```




    array([[1, 3, 5],
           [2, 4, 6]])




```python
d2.reshape(1,6)  
```




    array([[1, 3, 5, 2, 4, 6]])



#### create 1D array 0-9


```python
np.arange(10)
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])



#### array 0 to 50 by 5 (start,stop,step)


```python
np.arange(0,51,5)
```




    array([ 0,  5, 10, 15, 20, 25, 30, 35, 40, 45, 50])



### Random number generator

very useful for permutation techniques or simulating data

import random from numpy


```python
from numpy import random
```

#### Generate a random float from 0 to 1


```python
random.rand()
```




    0.522697371937827



#### generate 5 random float from 0 to 1


```python
random.rand(5)
```




    array([0.19676603, 0.07227146, 0.0465148 , 0.15288889, 0.57168727])



#### generate random integer between 0-100


```python
random.randint(100)
```




    21



#### generate 7 random integer between 0-100


```python
random.randint(100, size = 7)
```




    array([33, 18, 93, 53, 20, 65,  5])



#### generate 2D array random integer between 0-100 


```python
random.randint(100, size=(2,3))
```




    array([[11,  9, 24],
           [73, 15, 23]])



### Choose or randomly sample list/array

#### sample from list


```python
random.choice([3, 5, 7, 9])
```




    3



#### sample 4 elements from list 


```python
random.choice([3, 5, 7, 9],size=4)
```




    array([7, 5, 5, 5])



### Math (https://numpy.org/doc/stable/reference/routines.math.html)

#### generate 100 random numbers from 1 to 1000 and get length, max, min, mean


```python
x = random.randint(1000,size=100)

print(len(x))
print(x.max())
print(x.min())
print(x.mean())
```

    100
    999
    20
    521.35


## Getting started with pandas - finally to the good stuff! 

#### side note: 

Nice thing about jupyter notebooks is it accepts linux commands, just as the terminal


```python
### Change to pandas working directory
pandas_dir = '/data/gpfs/home/tfaske/g/DataScience/pandas'
```


```python
cd $pandas_dir
```

    /data/gpfs/assoc/parchmanlab/tfaske/DataScience/pandas


### Read and write files (using DataFrame) 

Make sure you have **states_covid.csv** in your pandas directory from above


```python
import pandas as pd

state_covid_df = pd.read_csv('states_covid.csv') #read in csv
state_covid_df.head() #views the top 5 lines
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>death</th>
      <th>deathConfirmed</th>
      <th>deathIncrease</th>
      <th>deathProbable</th>
      <th>hospitalized</th>
      <th>hospitalizedCumulative</th>
      <th>hospitalizedCurrently</th>
      <th>hospitalizedIncrease</th>
      <th>...</th>
      <th>totalTestResults</th>
      <th>totalTestResultsIncrease</th>
      <th>totalTestsAntibody</th>
      <th>totalTestsAntigen</th>
      <th>totalTestsPeopleAntibody</th>
      <th>totalTestsPeopleAntigen</th>
      <th>totalTestsPeopleViral</th>
      <th>totalTestsPeopleViralIncrease</th>
      <th>totalTestsViral</th>
      <th>totalTestsViralIncrease</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2021-02-23</td>
      <td>AK</td>
      <td>290.0</td>
      <td>NaN</td>
      <td>0</td>
      <td>NaN</td>
      <td>1260.0</td>
      <td>1260.0</td>
      <td>38.0</td>
      <td>9</td>
      <td>...</td>
      <td>1653425.0</td>
      <td>4640</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0</td>
      <td>1653425.0</td>
      <td>4640</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2021-02-23</td>
      <td>AL</td>
      <td>9660.0</td>
      <td>7575.0</td>
      <td>68</td>
      <td>2085.0</td>
      <td>45250.0</td>
      <td>45250.0</td>
      <td>762.0</td>
      <td>122</td>
      <td>...</td>
      <td>2265086.0</td>
      <td>4825</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>115256.0</td>
      <td>NaN</td>
      <td>2265086.0</td>
      <td>4825</td>
      <td>NaN</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2021-02-23</td>
      <td>AR</td>
      <td>5377.0</td>
      <td>4321.0</td>
      <td>14</td>
      <td>1056.0</td>
      <td>14617.0</td>
      <td>14617.0</td>
      <td>545.0</td>
      <td>47</td>
      <td>...</td>
      <td>2609837.0</td>
      <td>4779</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>436309.0</td>
      <td>NaN</td>
      <td>0</td>
      <td>2609837.0</td>
      <td>4779</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2021-02-23</td>
      <td>AS</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0</td>
      <td>...</td>
      <td>2140.0</td>
      <td>0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0</td>
      <td>2140.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2021-02-23</td>
      <td>AZ</td>
      <td>15650.0</td>
      <td>13821.0</td>
      <td>148</td>
      <td>1829.0</td>
      <td>57072.0</td>
      <td>57072.0</td>
      <td>1515.0</td>
      <td>78</td>
      <td>...</td>
      <td>7478323.0</td>
      <td>19439</td>
      <td>435091.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>3709365.0</td>
      <td>6212</td>
      <td>7478323.0</td>
      <td>19439</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 41 columns</p>
</div>




```python
state_covid_df.shape #row, column length
```




    (20108, 41)




```python
state_covid_df.columns #views the column names
```




    Index(['date', 'state', 'death', 'deathConfirmed', 'deathIncrease',
           'deathProbable', 'hospitalized', 'hospitalizedCumulative',
           'hospitalizedCurrently', 'hospitalizedIncrease', 'inIcuCumulative',
           'inIcuCurrently', 'negative', 'negativeIncrease',
           'negativeTestsAntibody', 'negativeTestsPeopleAntibody',
           'negativeTestsViral', 'onVentilatorCumulative', 'onVentilatorCurrently',
           'positive', 'positiveCasesViral', 'positiveIncrease', 'positiveScore',
           'positiveTestsAntibody', 'positiveTestsAntigen',
           'positiveTestsPeopleAntibody', 'positiveTestsPeopleAntigen',
           'positiveTestsViral', 'recovered', 'totalTestEncountersViral',
           'totalTestEncountersViralIncrease', 'totalTestResults',
           'totalTestResultsIncrease', 'totalTestsAntibody', 'totalTestsAntigen',
           'totalTestsPeopleAntibody', 'totalTestsPeopleAntigen',
           'totalTestsPeopleViral', 'totalTestsPeopleViralIncrease',
           'totalTestsViral', 'totalTestsViralIncrease'],
          dtype='object')



While the above example is very straight forward with a clean csv file, **pd.read_csv()** is a very powerful tool for reading/parsing complicated data. For more information of all the commands it has, visit here: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html. Otherwise, google is your best friend. Any issue you have, someone has figured it out already. 

One common issue with all data formats are *Dates*. Pandas has a way to read dates in without much headache and nice features for doing things with dates. You can also only select various columns, rename headers, remove headers, change what characters you want to be recognized as NAs, etc.

Below is an example of some of the things you can do. 


```python
state_covid_sub_df = pd.read_csv('states_covid.csv',usecols=['date','state','death','positive','negative','totalTestResults'],parse_dates=['date'],infer_datetime_format=True)
state_covid_sub_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>death</th>
      <th>negative</th>
      <th>positive</th>
      <th>totalTestResults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2021-02-23</td>
      <td>AK</td>
      <td>290.0</td>
      <td>NaN</td>
      <td>55560.0</td>
      <td>1653425.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2021-02-23</td>
      <td>AL</td>
      <td>9660.0</td>
      <td>1882180.0</td>
      <td>488973.0</td>
      <td>2265086.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2021-02-23</td>
      <td>AR</td>
      <td>5377.0</td>
      <td>2359571.0</td>
      <td>316593.0</td>
      <td>2609837.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2021-02-23</td>
      <td>AS</td>
      <td>0.0</td>
      <td>2140.0</td>
      <td>0.0</td>
      <td>2140.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2021-02-23</td>
      <td>AZ</td>
      <td>15650.0</td>
      <td>2953210.0</td>
      <td>810658.0</td>
      <td>7478323.0</td>
    </tr>
  </tbody>
</table>
</div>



#### check and make sure dtypes are right (dates specifically)


```python
state_covid_sub_df.dtypes
```




    date                datetime64[ns]
    state                       object
    death                      float64
    negative                   float64
    positive                   float64
    totalTestResults           float64
    dtype: object



### write DataFrame to outfile 
(https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_csv.html)

**note:** make sure you provide the path or are in the working directory you want


```python
outfile_path = '/data/gpfs/home/tfaske/g/DataScience/pandas/state_covid_sub.csv'
state_covid_sub_df.to_csv(path_or_buf=outfile_path,index=False)
```

## Manipulate DataFrame 

While read_csv is a powerful tool, we are going to subset, rename, change dtypes, and filter on our own just as a practice


```python
state_covid_df = pd.read_csv('states_covid.csv')
```

#### Select only columns date, state, death, negative, postive, totalTestResults 


```python
new_covid_df = state_covid_df[['date','state','death','positive','negative','totalTestResults']]
new_covid_df.head() 
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>death</th>
      <th>positive</th>
      <th>negative</th>
      <th>totalTestResults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2021-02-23</td>
      <td>AK</td>
      <td>290.0</td>
      <td>55560.0</td>
      <td>NaN</td>
      <td>1653425.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2021-02-23</td>
      <td>AL</td>
      <td>9660.0</td>
      <td>488973.0</td>
      <td>1882180.0</td>
      <td>2265086.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2021-02-23</td>
      <td>AR</td>
      <td>5377.0</td>
      <td>316593.0</td>
      <td>2359571.0</td>
      <td>2609837.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2021-02-23</td>
      <td>AS</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2140.0</td>
      <td>2140.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2021-02-23</td>
      <td>AZ</td>
      <td>15650.0</td>
      <td>810658.0</td>
      <td>2953210.0</td>
      <td>7478323.0</td>
    </tr>
  </tbody>
</table>
</div>



#### two ways to change column names totalTestResults to total 
first changes all colums:  
`new_covid_df.columns = ['date','state','death','positive','negative','total']`  

Second code below:  
changes only selected column  
axis = (0 = rows, 1 = columns)  
inplace=True replaces the current DataFrame, same as (df = df.DOSOMETHING) 


```python
new_covid_df.rename({'totalTestResults':'total'},axis=1,inplace=True)
```

#### two ways to reorder columns
`new_covid_df = new_covid_df[['date','state','total','negative','positive','death']]`  
`new_covid_df = new_covid_df.iloc[:,[0,1,5,4,3,2]]` #iloc is how you access df like a matrix


```python
new_covid_df = new_covid_df[['date','state','total','negative','positive','death']]
```

#### add a column (positivity rate)
`new_covid_df['rate'] = new_covid_df.positive / new_covid_df.total` #alternate way


```python
new_covid_df['rate'] = new_covid_df['positive'] / new_covid_df['total']
```

#### Date manipulation
There's lots of crazy stuff you can do with dates, not going into it too much but just letting you know you can do it and something worth looking into


```python
new_covid_df["date"]= pd.to_datetime(new_covid_df["date"],yearfirst=True) 
new_covid_df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 20108 entries, 0 to 20107
    Data columns (total 7 columns):
    date        20108 non-null datetime64[ns]
    state       20108 non-null object
    total       20006 non-null float64
    negative    15640 non-null float64
    positive    19912 non-null float64
    death       19230 non-null float64
    rate        19824 non-null float64
    dtypes: datetime64[ns](1), float64(5), object(1)
    memory usage: 1.1+ MB


#### add a column for day of year/julian date


```python
new_covid_df['dayofyear'] = new_covid_df['date'].dt.dayofyear
new_covid_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>total</th>
      <th>negative</th>
      <th>positive</th>
      <th>death</th>
      <th>rate</th>
      <th>dayofyear</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2021-02-23</td>
      <td>AK</td>
      <td>1653425.0</td>
      <td>NaN</td>
      <td>55560.0</td>
      <td>290.0</td>
      <td>0.033603</td>
      <td>54</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2021-02-23</td>
      <td>AL</td>
      <td>2265086.0</td>
      <td>1882180.0</td>
      <td>488973.0</td>
      <td>9660.0</td>
      <td>0.215874</td>
      <td>54</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2021-02-23</td>
      <td>AR</td>
      <td>2609837.0</td>
      <td>2359571.0</td>
      <td>316593.0</td>
      <td>5377.0</td>
      <td>0.121308</td>
      <td>54</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2021-02-23</td>
      <td>AS</td>
      <td>2140.0</td>
      <td>2140.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.000000</td>
      <td>54</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2021-02-23</td>
      <td>AZ</td>
      <td>7478323.0</td>
      <td>2953210.0</td>
      <td>810658.0</td>
      <td>15650.0</td>
      <td>0.108401</td>
      <td>54</td>
    </tr>
  </tbody>
</table>
</div>



#### subsetting/filtering data
subset or filter on multiple columns and data types (numeric or string)

First, we'll subset on Nevada only and peak in to what it is doing


```python
new_covid_df.state == 'NV'
```




    0        False
    1        False
    2        False
    3        False
    4        False
             ...  
    20103    False
    20104    False
    20105    False
    20106    False
    20107    False
    Name: state, Length: 20108, dtype: bool



You can't really see where but it is outputtig a list of boolean (True,False) in the order they are found. If you put this statement as an index, it will keep only the Trues

**subsetting NV only**


```python
NV_covid_df = new_covid_df[new_covid_df.state == 'NV']
NV_covid_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>total</th>
      <th>negative</th>
      <th>positive</th>
      <th>death</th>
      <th>rate</th>
      <th>dayofyear</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>36</th>
      <td>2021-02-23</td>
      <td>NV</td>
      <td>2678249.0</td>
      <td>1106648.0</td>
      <td>291543.0</td>
      <td>4903.0</td>
      <td>0.108856</td>
      <td>54</td>
    </tr>
    <tr>
      <th>92</th>
      <td>2021-02-22</td>
      <td>NV</td>
      <td>2667800.0</td>
      <td>1103209.0</td>
      <td>291145.0</td>
      <td>4882.0</td>
      <td>0.109133</td>
      <td>53</td>
    </tr>
    <tr>
      <th>148</th>
      <td>2021-02-21</td>
      <td>NV</td>
      <td>2662867.0</td>
      <td>1101946.0</td>
      <td>290972.0</td>
      <td>4872.0</td>
      <td>0.109270</td>
      <td>52</td>
    </tr>
    <tr>
      <th>204</th>
      <td>2021-02-20</td>
      <td>NV</td>
      <td>2656833.0</td>
      <td>1100139.0</td>
      <td>290671.0</td>
      <td>4868.0</td>
      <td>0.109405</td>
      <td>51</td>
    </tr>
    <tr>
      <th>260</th>
      <td>2021-02-19</td>
      <td>NV</td>
      <td>2650086.0</td>
      <td>1098605.0</td>
      <td>290300.0</td>
      <td>4831.0</td>
      <td>0.109544</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
</div>



Let's do one more filtering on states and something else numeric

| means or   
& means and


```python
new_covid_df[(new_covid_df.state == 'NV') & (new_covid_df.rate > 0.10)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>total</th>
      <th>negative</th>
      <th>positive</th>
      <th>death</th>
      <th>rate</th>
      <th>dayofyear</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>36</th>
      <td>2021-02-23</td>
      <td>NV</td>
      <td>2678249.0</td>
      <td>1106648.0</td>
      <td>291543.0</td>
      <td>4903.0</td>
      <td>0.108856</td>
      <td>54</td>
    </tr>
    <tr>
      <th>92</th>
      <td>2021-02-22</td>
      <td>NV</td>
      <td>2667800.0</td>
      <td>1103209.0</td>
      <td>291145.0</td>
      <td>4882.0</td>
      <td>0.109133</td>
      <td>53</td>
    </tr>
    <tr>
      <th>148</th>
      <td>2021-02-21</td>
      <td>NV</td>
      <td>2662867.0</td>
      <td>1101946.0</td>
      <td>290972.0</td>
      <td>4872.0</td>
      <td>0.109270</td>
      <td>52</td>
    </tr>
    <tr>
      <th>204</th>
      <td>2021-02-20</td>
      <td>NV</td>
      <td>2656833.0</td>
      <td>1100139.0</td>
      <td>290671.0</td>
      <td>4868.0</td>
      <td>0.109405</td>
      <td>51</td>
    </tr>
    <tr>
      <th>260</th>
      <td>2021-02-19</td>
      <td>NV</td>
      <td>2650086.0</td>
      <td>1098605.0</td>
      <td>290300.0</td>
      <td>4831.0</td>
      <td>0.109544</td>
      <td>50</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>17508</th>
      <td>2020-04-17</td>
      <td>NV</td>
      <td>33881.0</td>
      <td>26238.0</td>
      <td>3524.0</td>
      <td>162.0</td>
      <td>0.104011</td>
      <td>108</td>
    </tr>
    <tr>
      <th>17564</th>
      <td>2020-04-16</td>
      <td>NV</td>
      <td>32746.0</td>
      <td>25130.0</td>
      <td>3321.0</td>
      <td>158.0</td>
      <td>0.101417</td>
      <td>107</td>
    </tr>
    <tr>
      <th>17620</th>
      <td>2020-04-15</td>
      <td>NV</td>
      <td>31276.0</td>
      <td>24444.0</td>
      <td>3211.0</td>
      <td>150.0</td>
      <td>0.102667</td>
      <td>106</td>
    </tr>
    <tr>
      <th>17676</th>
      <td>2020-04-14</td>
      <td>NV</td>
      <td>30241.0</td>
      <td>23573.0</td>
      <td>3088.0</td>
      <td>141.0</td>
      <td>0.102113</td>
      <td>105</td>
    </tr>
    <tr>
      <th>17732</th>
      <td>2020-04-13</td>
      <td>NV</td>
      <td>28978.0</td>
      <td>22493.0</td>
      <td>2971.0</td>
      <td>133.0</td>
      <td>0.102526</td>
      <td>104</td>
    </tr>
  </tbody>
</table>
<p>97 rows × 8 columns</p>
</div>



df.query() is another way that might look a little cleaner for more complicated filtering  
be careful with syntax of quotations 


```python
new_covid_df.query("state == 'NV' & rate > 0.10")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>total</th>
      <th>negative</th>
      <th>positive</th>
      <th>death</th>
      <th>rate</th>
      <th>dayofyear</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>36</th>
      <td>2021-02-23</td>
      <td>NV</td>
      <td>2678249.0</td>
      <td>1106648.0</td>
      <td>291543.0</td>
      <td>4903.0</td>
      <td>0.108856</td>
      <td>54</td>
    </tr>
    <tr>
      <th>92</th>
      <td>2021-02-22</td>
      <td>NV</td>
      <td>2667800.0</td>
      <td>1103209.0</td>
      <td>291145.0</td>
      <td>4882.0</td>
      <td>0.109133</td>
      <td>53</td>
    </tr>
    <tr>
      <th>148</th>
      <td>2021-02-21</td>
      <td>NV</td>
      <td>2662867.0</td>
      <td>1101946.0</td>
      <td>290972.0</td>
      <td>4872.0</td>
      <td>0.109270</td>
      <td>52</td>
    </tr>
    <tr>
      <th>204</th>
      <td>2021-02-20</td>
      <td>NV</td>
      <td>2656833.0</td>
      <td>1100139.0</td>
      <td>290671.0</td>
      <td>4868.0</td>
      <td>0.109405</td>
      <td>51</td>
    </tr>
    <tr>
      <th>260</th>
      <td>2021-02-19</td>
      <td>NV</td>
      <td>2650086.0</td>
      <td>1098605.0</td>
      <td>290300.0</td>
      <td>4831.0</td>
      <td>0.109544</td>
      <td>50</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>17508</th>
      <td>2020-04-17</td>
      <td>NV</td>
      <td>33881.0</td>
      <td>26238.0</td>
      <td>3524.0</td>
      <td>162.0</td>
      <td>0.104011</td>
      <td>108</td>
    </tr>
    <tr>
      <th>17564</th>
      <td>2020-04-16</td>
      <td>NV</td>
      <td>32746.0</td>
      <td>25130.0</td>
      <td>3321.0</td>
      <td>158.0</td>
      <td>0.101417</td>
      <td>107</td>
    </tr>
    <tr>
      <th>17620</th>
      <td>2020-04-15</td>
      <td>NV</td>
      <td>31276.0</td>
      <td>24444.0</td>
      <td>3211.0</td>
      <td>150.0</td>
      <td>0.102667</td>
      <td>106</td>
    </tr>
    <tr>
      <th>17676</th>
      <td>2020-04-14</td>
      <td>NV</td>
      <td>30241.0</td>
      <td>23573.0</td>
      <td>3088.0</td>
      <td>141.0</td>
      <td>0.102113</td>
      <td>105</td>
    </tr>
    <tr>
      <th>17732</th>
      <td>2020-04-13</td>
      <td>NV</td>
      <td>28978.0</td>
      <td>22493.0</td>
      <td>2971.0</td>
      <td>133.0</td>
      <td>0.102526</td>
      <td>104</td>
    </tr>
  </tbody>
</table>
<p>97 rows × 8 columns</p>
</div>



### Sort dataframe 
https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.sort_values.html

**sort and select top 5 positive days**


```python
new_covid_df.sort_values('positive',ascending=False,inplace=True)
new_covid_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>state</th>
      <th>total</th>
      <th>negative</th>
      <th>positive</th>
      <th>death</th>
      <th>rate</th>
      <th>dayofyear</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5</th>
      <td>2021-02-23</td>
      <td>CA</td>
      <td>47513367.0</td>
      <td>NaN</td>
      <td>3450058.0</td>
      <td>49563.0</td>
      <td>0.072612</td>
      <td>54</td>
    </tr>
    <tr>
      <th>61</th>
      <td>2021-02-22</td>
      <td>CA</td>
      <td>47320802.0</td>
      <td>NaN</td>
      <td>3446611.0</td>
      <td>49338.0</td>
      <td>0.072835</td>
      <td>53</td>
    </tr>
    <tr>
      <th>117</th>
      <td>2021-02-21</td>
      <td>CA</td>
      <td>47043348.0</td>
      <td>NaN</td>
      <td>3441946.0</td>
      <td>49105.0</td>
      <td>0.073165</td>
      <td>52</td>
    </tr>
    <tr>
      <th>173</th>
      <td>2021-02-20</td>
      <td>CA</td>
      <td>46813876.0</td>
      <td>NaN</td>
      <td>3435186.0</td>
      <td>48825.0</td>
      <td>0.073380</td>
      <td>51</td>
    </tr>
    <tr>
      <th>229</th>
      <td>2021-02-19</td>
      <td>CA</td>
      <td>46621654.0</td>
      <td>NaN</td>
      <td>3428518.0</td>
      <td>48344.0</td>
      <td>0.073539</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
</div>



## Creating a DataFrame

There are a few different ways to create a DataFrame from scratch or non-csv/excel formatted data

### DataFrame from NumPy  
ndarray formats translate nicely into DataFrames. Let's generate some fake data using the random function in NumPy to demonstrate. Say this made up data is different sites and persons ratings (0-5) of 8 GREAT Nicholas Cage movies. 


```python
###generate a random array (8 rows, 6 columns) with values ranging 0-50  
movieRank_np = random.randint(5, size=(8,6))
```

Lets make up some column names for this data  


```python
col_names = ['RottenTomatoes','IMBD','MovieCritic','Julie','Trevor','Jahner']
movieRank_df = pd.DataFrame(movieRank_np,columns=col_names)
```

Lets add a column for movie titles and make them the index as well


```python
movies = ['FaceOff','RaisingArizona','WeatherMan','WickerMan','Adaptation','Gone60Seconds','ConAir','TheRock']  
movieRank_df['movie'] = movies  
movieRank_df.index = movies
movieRank_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>RottenTomatoes</th>
      <th>IMBD</th>
      <th>MovieCritic</th>
      <th>Julie</th>
      <th>Trevor</th>
      <th>Jahner</th>
      <th>movie</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>FaceOff</th>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>0</td>
      <td>2</td>
      <td>4</td>
      <td>FaceOff</td>
    </tr>
    <tr>
      <th>RaisingArizona</th>
      <td>3</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>2</td>
      <td>0</td>
      <td>RaisingArizona</td>
    </tr>
    <tr>
      <th>WeatherMan</th>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>3</td>
      <td>4</td>
      <td>0</td>
      <td>WeatherMan</td>
    </tr>
    <tr>
      <th>WickerMan</th>
      <td>4</td>
      <td>1</td>
      <td>3</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>WickerMan</td>
    </tr>
    <tr>
      <th>Adaptation</th>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>1</td>
      <td>3</td>
      <td>3</td>
      <td>Adaptation</td>
    </tr>
    <tr>
      <th>Gone60Seconds</th>
      <td>0</td>
      <td>4</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>Gone60Seconds</td>
    </tr>
    <tr>
      <th>ConAir</th>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>2</td>
      <td>3</td>
      <td>ConAir</td>
    </tr>
    <tr>
      <th>TheRock</th>
      <td>0</td>
      <td>1</td>
      <td>3</td>
      <td>1</td>
      <td>4</td>
      <td>1</td>
      <td>TheRock</td>
    </tr>
  </tbody>
</table>
</div>




```python
movieRank_df.mean(axis=1) #mean rank per movie
```




    RottenTomatoes    1.500
    IMBD              1.375
    MovieCritic       2.500
    Julie             1.250
    Trevor            2.250
    Jahner            1.500
    dtype: float64



We all know these numbers are of course wrong because there's no rank below a 5 that should be given, but just an example

### Dataframe from dictionaries
Dictionaries are a bit confusing as a datatype but they are extremely powerful and fast and work with many datatypes. Lets do the same thing as above but using a for loop and a dicitonary


```python
col_namess = ['RottenTomatoes','IMBD','MovieCritic','Julie','Trevor','Jahner']
movieRank_dict = {} #creates empty dictionary 
for name in col_name:  
    rank = random.randint(5,size=8)
    movieRank_dict[name] = rank

movieRank_dict
```




    {'RottenTomatoes': array([4, 3, 0, 0, 0, 4, 0, 3]),
     'IMBD': array([0, 4, 1, 2, 3, 1, 1, 4]),
     'MovieCritic': array([0, 4, 4, 0, 2, 1, 3, 2]),
     'Julie': array([2, 4, 4, 0, 3, 3, 1, 1]),
     'Trevor': array([4, 2, 0, 0, 1, 3, 0, 4]),
     'Jahner': array([3, 3, 1, 2, 0, 1, 3, 0])}



#### from dicitionary to DataFrame


```python
movieRank_df = pd.DataFrame.from_dict(movieRank_dict)
movieRank_df.index = movies
movieRank_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>RottenTomatoes</th>
      <th>IMBD</th>
      <th>MovieCritic</th>
      <th>Julie</th>
      <th>Trevor</th>
      <th>Jahner</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>FaceOff</th>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>RaisingArizona</th>
      <td>3</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>WeatherMan</th>
      <td>0</td>
      <td>1</td>
      <td>4</td>
      <td>4</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>WickerMan</th>
      <td>0</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Adaptation</th>
      <td>0</td>
      <td>3</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>Gone60Seconds</th>
      <td>4</td>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>ConAir</th>
      <td>0</td>
      <td>1</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>TheRock</th>
      <td>3</td>
      <td>4</td>
      <td>2</td>
      <td>1</td>
      <td>4</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



Let's orient to DataFrame the other way just to show how


```python
movieRank_df = pd.DataFrame.from_dict(movieRank_dict,orient='index',columns=movies)
movieRank_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>FaceOff</th>
      <th>RaisingArizona</th>
      <th>WeatherMan</th>
      <th>WickerMan</th>
      <th>Adaptation</th>
      <th>Gone60Seconds</th>
      <th>ConAir</th>
      <th>TheRock</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>RottenTomatoes</th>
      <td>4</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>IMBD</th>
      <td>0</td>
      <td>4</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>MovieCritic</th>
      <td>0</td>
      <td>4</td>
      <td>4</td>
      <td>0</td>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Julie</th>
      <td>2</td>
      <td>4</td>
      <td>4</td>
      <td>0</td>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>Trevor</th>
      <td>4</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>3</td>
      <td>0</td>
      <td>4</td>
    </tr>
    <tr>
      <th>Jahner</th>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>3</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



# ta-daaaa, you're a pandas wizard now
