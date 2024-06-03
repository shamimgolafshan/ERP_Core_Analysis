# ERP_Core_Analysis

This repository contains the project completed for an EEG course, utilizing the ERP Core dataset to analyze EEG data and investigate N170 components.

## Table of Contents
- [Introduction](#introduction)
- [Data](#data)
- [Preprocessing](#preprocessing)
- [Method](#method)
- [Results](#results)
- [Extra Information](#extra-information)
- [Citation](#citation)

## Introduction

In this project, we aimed to enhance the quality of EEG data analysis using the ERP Core dataset, focusing on the N170 components. The dataset includes data from 40 individuals (25 females and 15 males), aged between 18 and 30 years (mean age 21.5). Of these participants, 38 were right-handed, and all were affiliated with the University of California, Davis community.

## Data

We employed the ERP Core dataset, which you can find here:
- [ERP Core Dataset](https://erpinfo.org/erp-core)

We used preprocessed data via the MADE pipeline:
- [Preprocessed fMRI Data](https://drive.google.com/drive/folders/14kD7H_xCRVA6v9qPj08LKN9EQ10ciTW0?usp=sharing)

## Preprocessing

To preprocess the EEG data, we used the MADE pipeline, a comprehensive preprocessing method using MATLAB and the EEGLAB toolbox.

## Method

Our study classified the dataset into two categories, "Texture" and "Object". The dataset comprised 80 samples, each with 90 predictors, equally divided into the two categories. We employed the Leave-One-Out Cross-Validation (LOOCV) method to evaluate various classification algorithms. The models used include:

- **Support Vector Machines (SVM) with Linear Kernel**: Evaluated using the `svmLinear` method in caret.
- **SVM with Radial Basis Function Kernel**: Evaluated using the `svmRadial` method to explore non-linear relationships.
- **Glmnet (Regularized Regression)**: Combines ridge and lasso regression, evaluated using the `glmnet` method.
- **Random Forest**: An ensemble method known for robustness and effectiveness in handling complex interactions.
- **Neural Network**: Explored using the Multi-Layer Perceptron (MLP) method, tuned for size and decay parameters.

The bar chart below depicts Kappa and Accuracy for each model:

![Model Evaluation](https://github.com/shamimgolafshan/ERP_Core_Analysis/assets/35660420/1f8e8b76-4963-41e1-a834-72d9ab6ace78)

## Results

For the initial analysis, use the `.ipynb` file to load data and build a feature matrix which is saved as a `.csv` file. This file can be downloaded from this repository.

## Extra Information

In the "Further Stat Analysis" folder, you will find the R scripts and statistical analysis based on the following hypothesis:

### Hypothesis

- **Question**: Is there a difference in the amplitude of the N170 component when participants are exposed to textures compared to objects?
- **Hypothesis**: It is hypothesized that the N170 component's average amplitude will be significantly greater when elicited by object stimuli as opposed to texture stimuli, indicating that object recognition may require more neural resources.

### Statistical Methods

- **Linear Regression**: Tests the hypothesis that the N170 amplitude differs between object and texture stimuli while controlling for age, sex, and handedness.
  
  Formula:
  ```plaintext
  Avg N170 Amplitude = b0 + β1(stimulus type) + β2(Age) + β3(Sex) + β4(handedness) + ε
  ```

- **Mixed Effects Models**: Accounts for correlations within individuals and non-independence of observations.
  
  Formula:
  ```plaintext
  Avg N170 Amplitudeij = b0 + β1(stimulus typeij) + β2(Agei) + β3(Sexi) + β4(Handednessi) + u0i + εij
  ```

- **ANCOVA**: Investigates the effect of visual stimuli type on the N170 amplitude while controlling for covariates.
  
  Formula:
  ```plaintext
  Avg N170 Amplitudeij = μ + τi + β1(Ageij) + β2(Sexij) + β3(handednessij) + εij
  ```

## Citation

If you use this project in your research, please cite the following articles:

1. Kappenman, Emily S., et al. "ERP CORE: An open resource for human event-related potential research." NeuroImage 225 (2021): 117465.
2. Debnath, Ranjan, et al. "The Maryland analysis of developmental EEG (MADE) pipeline." Psychophysiology 57.6 (2020): e13580.

