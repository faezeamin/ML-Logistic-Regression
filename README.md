# ML-Logistic-Regression
Logistic Regression algorithm to classify two classes of 2-D data samples using 1) 2-D feature vector &amp; 2) its mapping 
to a higher dimensional feature space. 

 The first program implements Logistic Regression to classify two classes of data in data space. It uses fminunc() function 
 to find the optimal coefficients of the model.
 
 The second program implements Logistic Regression. The 2_D feature vector of the data points is first mapped into a 
 polynomial of desired degree, say 6 (which is equivalent to a 28-D feature vector). Enhancing the dimension of feature space
 helps finding a more sophisticated decision boundary, however it is vulnerable to overfitting. To combat this problem, a 
 regularizer term is included in the cost function. Lambda is the coefficient of regularizer. Small lambda proceeds to 
 create a more complex decision boundary, where more number of training data points classified correct. On the other hand,
 larger lambda leads to smoother and simpler decision boundary.
