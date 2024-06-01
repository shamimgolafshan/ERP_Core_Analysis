# ERP_Core_Analysis
In this project that we have done for my EEG course, we employed the ERP Core dataset [1], which comprises data from 40 individuals,
including 25 females and 15 males, aged between 18 and 30 years (mean age 21.5). Of these
participants, 38 were right-handed, and all were affiliated with the University of California, Davis
community. We used N170 Components that you can find here: 
<br />https://erpinfo.org/erp-core

<br /> For initial Analysis use the .ipynb file to load data and build a feature matrix which is a .csv file 
## Dataset Description: 
Participants were instructed to discern whether the stimulus presented was an object (either a face
or a car) or a “texture” (scrambled versions of the stimuli) and respond by pressing one of two
keys with their dominant hand. 
<img width="658" alt="image" src="https://github.com/shamimgolafshan/ERP_Core_Analysis/assets/35660420/c67401d2-88b0-412d-9d92-a314988a0c86">
## Preprocessing:
To pre-process EEG data we employed the MADE pipeline [2], which is a comprehensive pipeline
using MATLAB and the EEGLAB toolbox.
## Method:
Our study employed a comprehensive approach to classify the given dataset into two categories,
labeled "Texture" and "Object". The dataset was first prepared for analysis using R, a statistical
computing environment, with the assistance of the caret package. This data comprised 80 samples,
each with 90 predictors, equally divided into the two categories. To evaluate the effectiveness of
various classification algorithms, we employed the Leave-One-Out Cross-Validation (LOOCV)
method. This method is particularly useful for small datasets as it maximizes the training data by
using n-1 samples for training and the remaining one for testing in each iteration, where n is the
number of samples. Several machine learning models were trained and evaluated:
  - Support Vector Machines (SVM) with Linear Kernel: This model was first in our
    evaluation lineup. The svmLinear method in caret was utilized, providing insights into the
    linear separability of the data.
  - SVM with Radial Basis Function Kernel: To explore non-linear relationships, we used the
    svmRadial method. This model offers flexibility in handling data that is not linearly
    separable.
  - Glmnet (Regularized Regression): As an alternative to SVM, the glmnet model offers a
    blend of ridge and lasso regression, which is beneficial for datasets with a large number of
    predictors.
  - Random Forest: This ensemble method, known for its robustness and effectiveness in
    handling complex interaction, was also tested.
  - Neural Network: Finally, we explored the capabilities of neural networks using the Multi
    Layer Perceptron (MLP) method. The model was tuned over different combinations of size
    (number of units in the hidden layer) and decay (weight decay parameter), with the
    maximum number of iterations set to 200.

<br />The Bar Chart below Depicting Kappa and Accuracy for Each Model:
<img width="877" alt="image" src="https://github.com/shamimgolafshan/ERP_Core_Analysis/assets/35660420/1f8e8b76-4963-41e1-a834-72d9ab6ace78">

## Extra Information:
In the folder "Further Stat Analysis," you can find loading data in R and my stat analysis based on 

Hypothesis
Question: Is there a difference in the amplitude of the N170 component when participants are
exposed to textures compared to objects?
Hypothesis: It is hypothesized that, within a defined time window, the N170 component's average
amplitude will be significantly greater when elicited by object stimuli as opposed to texture
stimuli.It means that the cognitive processes involved in object recognition may require more
neural resources, resulting in a greater N170 amplitude for objects than for textures.
To test this hypothesis, we will run methods below and compare them:
### Linear Regression
To test the hypothesis that the N170 amplitude differs between object and texture stimuli we want to use linear regression while age, sex, and handedness are controlled. Formula:
𝑨𝒗𝒈 𝑵𝟏𝟕𝟎 𝑨𝒎𝒑𝒍𝒊𝒕𝒖𝒅𝒆 = 𝒃𝟎 + 𝜷𝟏(𝒔𝒕𝒊𝒎𝒖𝒍𝒖𝒔 𝒕𝒚𝒑𝒆) + 𝜷𝟐(𝑨𝒈𝒆) + 𝜷𝟑(𝑺𝒆𝒙) + 𝜷𝟒(𝒉𝒂𝒏𝒅𝒆𝒅𝒏𝒆𝒔𝒔) + 𝝐
Description of variables:
- Stimulus Type (object = 1, texture = 0): binary independent variable indicating whether the stimulus is an object or a texture.
- Average N170 Amplitude: This is the dependent variable, representing the mean amplitude of the N170 component within a specific time window (150-200 ms post- stimulus).
- Age: continuous independent variable representing the participant's age.
- Sex (female = 1, male = 0): binary independent variable indicating the participant's
sex.
- Handedness (right-handed = 1, left-handed = 0): binary independent variable
indicating the participant's handedness, included to control for potential effects on N170 amplitude. The majority of participants are right-handed but including it as a control variable ensures that any potential effects are accounted for.
- 𝒃𝟎: The intercept indicating the expected value of the N170 amplitude when all predictors are zero.
- 𝜷𝟏 ... 𝜷𝟒 : The coefficients for each predictor representing the expected change in N170 amplitude with a one-unit change in the predictor, holding all other predictors constant.
- ε: The error term accounting for the variance in N170 amplitude not explained by the
model.
### Mixed Effects Models
The Mixed-Effects Model is a good option for applying this method on ERP core dataset to consider correlations within individuals and handle non-independence of observations. Formula:
-𝑨𝒗𝒈 𝑵𝟏𝟕𝟎 𝑨𝒎𝒑𝒍𝒊𝒕𝒖𝒅𝒆𝒊𝒋 = 𝒃𝟎 + 𝜷𝟏5𝒔𝒕𝒊𝒎𝒖𝒍𝒖𝒔 𝒕𝒚𝒑𝒆𝒊𝒋8 + 𝜷𝟐(𝑨𝒈𝒆𝒊) + 𝜷𝟑(𝑺𝒆𝒙𝒊) + 𝜷𝟒(𝑯𝒂𝒏𝒅𝒆𝒅𝒏𝒆𝒔𝒔𝒊) + 𝒖𝟎𝒊 + 𝝐𝒊𝒋
Description of variables:
- 𝑨𝒗𝒈 𝑵𝟏𝟕𝟎 𝑨𝒎𝒑𝒍𝒊𝒕𝒖𝒅𝒆𝒊𝒋 :
 The dependent variable, representing the average
  amplitude of the N170 component for the
- 𝒃𝟎: The intercept, the expected value of the N170 amplitude when all predictors are zero.
- 𝒔𝒕𝒊𝒎𝒖𝒍𝒖𝒔 𝒕𝒚𝒑𝒆𝒊𝒋 : 𝑖&'
- 𝑨𝒈𝒆𝒊:   𝑖&'
- 𝑺𝒆𝒙𝒊:   𝑖&'
𝑗&'   𝑖&'
observation in the
participant.
 A categorical independent variable indicating the type of stimulus
𝑗&'
   presented to the
participant at the
observation(0 for texture and 1 for object)
 continuous independent variable representing the age of the
participant.
 categorical independent variable representing the sex of the
participant(0 for
 male and 1 for female)

- 𝑯𝒂𝒏𝒅𝒆𝒅𝒏𝒆𝒔𝒔𝒊 : 𝑖&'
- 𝜷𝟏...𝜷𝟒:
- 𝝐𝒊𝒋:     𝑖&'
- 𝒊 : Index for participants
- 𝒋: Index for observations per participant
- 𝒖𝟎𝒊:   𝑖&'
### ANCOVA
we use ANCOVA to investigate the effect of visual stimuli type (object vs. texture) on the N170 amplitude while controlling for covariates such as age, sex, and handedness Formula:
𝑨𝒗𝒈 𝑵𝟏𝟕𝟎 𝑨𝒎𝒑𝒍𝒊𝒕𝒖𝒅𝒆𝒊𝒋 = 𝝁 + 𝝉𝒊 + 𝜷𝟏5𝑨𝒈𝒆𝒊𝒋8 + 𝜷𝟐5𝑺𝒆𝒙𝒊𝒋8 + 𝜷𝟑5𝒉𝒂𝒏𝒅𝒆𝒅𝒏𝒆𝒔𝒔𝒊𝒋8 + 𝝐𝒊𝒋
Description of variables:
- 𝐀𝐯𝐠 𝐍𝟏𝟕𝟎 𝐀𝐦𝐩𝐥𝐢𝐭𝐮𝐝𝐞𝐢𝐣: The dependent variable, representing the N170 component amplitude for the 𝑗&' participant exposed to the 𝑖&' type of stimulus (i.e., object or
texture).
- 𝝁: The overall average amplitude of the N170 component across all participants and conditions.
- 𝝉𝒊: The effect of the 𝑖&' stimulus type on the N170 amplitude.
- 𝑨𝒈𝒆 𝒊𝒋: The age of the 𝑗&' participant exposed to the 𝑖&' type of stimulus, it is a
continuous covariate.
- 𝑺𝒆𝒙 𝒊𝒋: The sex of the 𝑗&' participant (0 for male and 1 for female), it is a binary covariate.
- 𝒉𝒂𝒏𝒅𝒆𝒅𝒏𝒆𝒔𝒔𝒊𝒋: The handedness of the 𝑗&' participant (0 for left-handed and 1 for right-handed), it is a binary covariate.
- 𝜷𝟏 ... 𝜷𝟑:The coefficients for the covariates, representing the expected change in the N170 amplitude with a one-unit change in age, the change from male to female for sex, and the change from left-handed to right-handed for handedness, respectively.
 categorical independent variable representing the handedness of the
 participant (0 for left-handed and 1 for right-handed)
 The fixed effect coefficients for each predictor, quantifying the association
 between the predictor and the average N170 amplitude.
𝑗&'
 The residual error for the
observation in the
participant, representing the
 variability in N170 amplitude not explained by the model or the random intercepts.
 The random intercept for the
participant, accounting for the individual-specific
 random variation in N170 amplitude that is not captured by the fixed effects.

- 𝝐𝒊𝒋:The error term for the 𝑗&' participant exposed to the 𝑖&' type of stimulus, accounting for variability in N170 amplitude not explained by the model.
 




[1]Kappenman, Emily S., et al. "ERP CORE: An open resource for human event-related potential research." NeuroImage 225 (2021): 117465.
<br />[2]Debnath, Ranjan, et al. "The Maryland analysis of developmental EEG (MADE) pipeline." Psychophysiology 57.6 (2020): e13580.
