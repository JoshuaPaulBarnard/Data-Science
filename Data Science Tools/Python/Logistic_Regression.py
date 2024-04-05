import json
import numpy as np

def create_train_test_sets(features, target, test_size=0.2, random_state=None):
    """
    This function splits the input data into training and testing sets,
    with the ability to specify the size of the test set and an optional
    random seed for reproducibility. The function uses Numpy's random
    number generator to shuffle the data and split it into two sets,
    ensuring that the data is randomized during the splitting process.

    Arguments:
        features (list or array-like): The features to be split into training and testing sets.
        target (list or array-like): The target variable to be split into training and testing sets.
        test_size (float, optional): The proportion of the data to be included in the test set. Defaults to 0.2.
        random_state (int, optional): An optional random seed to set for reproducibility. Defaults to None.

    Returns:
        train_features (list or array-like): The training features subset.
        test_features (list or array-like): The testing features subset.
        train_target (list or array-like): The training target subset.
        test_target (list or array-like): The testing target subset.
    """
    # If a random seed is provided, set the seed in Numpy's random number generator
    if random_state is not None:
        np.random.seed(random_state)

    # Create a shuffled index array using Numpy's random permutation function
    shuffled_indices = np.random.permutation(len(features))

    # Shuffle the data and target based on the shuffled indices
    features_shuffled = features[shuffled_indices]
    target_shuffled = target[shuffled_indices]

    # Calculate the size of the test set based on the test_size parameter and the total size of the data
    test_set_size = int(test_size * len(features))

    # Split the shuffled data and target into test and train sets, with the test set taking the first test_set_size elements and the train set taking the rest
    test_features = features_shuffled[:test_set_size]
    train_features = features_shuffled[test_set_size:]
    test_target = target_shuffled[:test_set_size]
    train_target = target_shuffled[test_set_size:]

    # Return the train and test sets
    return train_features, test_features, train_target, test_target


def sigmoid(z):
    """
    This function calculates the sigmoid activation function of a given input 'z'.
    The sigmoid function squashes its input values between 0 and 1.

    Args:
        z (float): The input value to the sigmoid function.

    Returns:
        float: The sigmoid activation value of the input 'z'.

    The function uses the NumPy exponential function 'np.exp()' to compute the 
    output of the sigmoid function.
    """
    # Calculate the sigmoid value using NumPy's exponential function
    return 1 / (1 + np.exp(-z))


def logistic_regression(features, target, test_set_size = 0.2, state_seed=None, learning_rate=0.01, number_of_epochs=1000, threshold=0.5, l1_regularization=0.0, l2_regularization=0.0):
    """
    This function implements logistic regression as a binary classifier.
    It takes the input features and target variable, and learns the logistic regression model
    using gradient descent. The learned model is then evaluated on the test set
    to determine the accuracy.
    Logistic regression is a supervised learning algorithm used for binary classification tasks. It predicts 
    whether a target variable is 0 or 1 based on a set of input features. The function uses gradient descent to 
    optimize the model parameters (weights and bias) and minimize the cross-entropy loss.
    Note: This function uses stochastic gradient descent for optimization, which means that the model parameters 
    will be updated randomly at each iteration. To achieve better results, you may want to experiment with 
    different values of learning_rate and number_of_epochs.

    Inputs:
    - features (numpy array): The input features of the dataset, shape (n_samples, n_features).
    - target (numpy array): The target variable of the dataset, shape (n_samples,).
    - test_size (float, optional): The proportion of the data to be included in the test set. Defaults to 0.2.
    - learning_rate (float, optional): The learning rate for gradient descent. Defaults to 0.01.
    - number_of_epochs (int, optional): The number of epochs to run gradient descent. Defaults to 1000.
    - threshold (float, optional): The threshold for the predicted probabilities to assign labels. Defaults to 0.5.

    Outputs:
    - weights (numpy array): The learned weights of the logistic regression model.
    - bias (float): The learned bias of the logistic regression model.
    - accuracy (float): The accuracy of the model on the test set.
    """
    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = create_train_test_sets(features, target, test_size=test_set_size, random_state=state_seed)

    # Initialize model parameters
    weights = np.zeros(features.shape[1])
    bias = 0

    # Iterative optimization using gradient descent
    for epoch in range(number_of_epochs):
        # Predict the output
        y_pred = 1 / (1 + np.exp(-np.dot(X_train, weights) - bias))

        # Calculate the loss, with regularization
        loss = -np.dot(y_train * np.log(y_pred), X_train) - np.dot((1 - y_train) * np.log(1 - y_pred), X_train)
        loss += l1_regularization * np.sum(np.abs(weights)) + l2_regularization * np.sum(weights ** 2)

        # Calculate gradients, with regularization
        if y_train.size is 0:
            return print("Error:  Training set has size 0")
        gradient_wrt_weights = np.dot(X_train.T, (y_pred - y_train)) / y_train.size + l1_regularization * np.sign(weights) + l2_regularization * weights
        gradient_wrt_bias = np.sum(y_pred - y_train) / y_train.size

        # Update model parameters using learning rate
        weights -= learning_rate * gradient_wrt_weights
        bias -= learning_rate * np.sum(gradient_wrt_bias)

    # Evaluate the model on the test set
    z_test = np.dot(X_test, weights) + bias
    y_pred_test = sigmoid(z_test) > threshold
    accuracy = np.mean(np.round(y_pred_test) == y_test)

    # Return the model parameters and test accuracy
    return weights, bias, accuracy, loss





# Example usage:
data_file = 'B:/Documents/DataAnnotation/Customer_Churn_Prediction.json'


# Load the JSON data
with open(data_file, 'r') as f:
    data = json.load(f)


# Extract features and target variable
X = np.array([[d['age'], d['usage_patterns']['frequency_of_use'], d['usage_patterns']['usage_time'], d['customer_service_interactions']['number_of_calls'], d['customer_service_interactions']['satisfaction_ratings'], d['billing_information']['monthly_charges']] for d in data])
y = np.array([d['churned'] for d in data])


# Perform Regression
w, b, accuracy, loss = logistic_regression(X, y)
print("Model Parameters: w = ", w)
print("Model Parameters: b = ", b)
print("Test Loss: ", loss)
print("Test Accuracy: ", accuracy)