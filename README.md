# ERP_Core_Analysis
In this project that we have done for my EEG course, we employed the ERP Core dataset [1], which comprises data from 40 individuals,
including 25 females and 15 males, aged between 18 and 30 years (mean age 21.5). Of these
participants, 38 were right-handed, and all were affiliated with the University of California, Davis
community. We used N170 Components that you can find here: 
<br />https://erpinfo.org/erp-core
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






[1]Kappenman, Emily S., et al. "ERP CORE: An open resource for human event-related potential research." NeuroImage 225 (2021): 117465.
<br />[2]Debnath, Ranjan, et al. "The Maryland analysis of developmental EEG (MADE) pipeline." Psychophysiology 57.6 (2020): e13580.
