# Reproducible research: version control and R

# ANSWERS

## Questions 1-3

Answers to questions 1, 2, and 3 can be found in the README.md within the dev branch og my logistic_growth repository: https://github.com/otter456/logistic_growth

## Question 4

a) The code to produce two random walks creates two distinct paths. The paths begin at the (x,y) coordinates (0,0) and takes a step at a fixed distance (h=0.25). This step is taken in a direction that is given by a random angle betweeen 0 and 2π (360 degrees). At the new (x,y) coordinate reached, another step is taken in a different random direction. This repeats 500 times, where at each iteration, the angels are chosen from a uniform distribution. 

b) A random seed is a value used to initiate a pseudo-random number-generator, such as runif() used in the code. A pseudo-random number-generator will consist of many long lists of pseudo-random numbers, with each list indexed by a seed. When the pseudo-random number-generator is called for the first time, a seed will be generated and the first number in the list will be indexed by that seed will be returned. Each further time the number-generator is called, the function will return the next number in the list indexed by the seed found previously. 

c) To make a reproducible simulation, use set.seed() to ensure the same random distribution is given each time. 

![image](https://github.com/otter456/reproducible-research_homework/assets/150150890/e63d8da1-2d55-40f8-b69c-485226d2e53c)


**(found in question-4-code/random_walk.R)**

## Question 5

a) There are 13 columns and 33 rows. 

b) Apply log transformation to V (Virion.volume..mn.mn.mn.) and L (Genome.length..kb.) to fit a linear model to the data. This changes the allometric equation from **V = βL^α** to **ln(V) = ln(β) + αln(L)**.

c) After running the linear model, we find that the estimate for the intercept = 7.0748 and the gradient = 1.5152. α is the gradient, therefore, α = 1.52 (2dp). ln(β) is the intercept, therefore, ln(β) = 7.0748 and hence β = e^7.0748 = 1182. These values are both statistically significant (<0.001) with a p-value of 6.438x10^-10 and match the values in table 2 of the paper. 

d) Code to plot data on a log-log plot:

![image](https://github.com/otter456/reproducible-research_homework/assets/150150890/e3bc71c0-5d66-4b0c-9062-bb829be332ca)

e) The estimated volume of a 300 kb dsDNA virus is 6696966.

**(found in question-5-data/virology_model.R)**

## Bonus Question 

*Explain the difference between reproducibility and
replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations
do they have?* 

Reproducibility refers to instances when consistent results are obtained by independent researchers using the same input data, computations steps, methods and conditions of analysis. Replicability on the other hand, is obtaining consistant results across studies aimed at answering the same scieitific questions, each of which has obtained its own data. 

Git is the most commonly used version control system and can help to enhance reproducibility and replicability of sceintific research. It is used for tracking changes in the course code, enabling multiple developers to work together on non-linear development. This is possible because of its branching capabilities which make it advantageous over centralised version control systems. 


 

### References 

- [ https://www.ncbi.nlm.nih.gov/books/NBK547546/# ]

- [https://www.nobledesktop.com/learn/git/what-is-git#:~:text=Git%20is%20the%20most%20commonly,be%20merged%20into%20one%20source.]

- 
# INSTRUCTIONS FOR ASSIGNMENT 

## Introduction

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
