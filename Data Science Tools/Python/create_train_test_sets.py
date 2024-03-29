import numpy as np

def create_train_test_sets(data, test_size=0.2, random_state=None):
    """
    This function splits the input data into training and testing sets,
    with the ability to specify the size of the test set and an optional
    random seed for reproducibility. The function uses Numpy's random
    number generator to shuffle the data and split it into two sets,
    ensuring that the data is randomized during the splitting process.

    Arguments:
        data (list or array-like): The data to be split into training and testing sets.
        test_size (float, optional): The proportion of the data to be included in the test set. Defaults to 0.2.
        random_state (int, optional): An optional random seed to set for reproducibility. Defaults to None.

    Returns:
        train_data (list or array-like): The training data subset.
        test_data (list or array-like): The testing data subset.
    """
    # If a random seed is provided, set the seed in Numpy's random number generator
    if random_state is not None:
        np.random.seed(random_state)

    # Create a shuffled index array using Numpy's random permutation function
    shuffled_indices = np.random.permutation(len(data))
    
    # Shuffle the data based on the shuffled indices
    data_shuffled = data[shuffled_indices]

    # Calculate the size of the test set based on the test_size parameter and the total size of the data
    test_set_size = int(test_size * len(data))
    
    # Split the shuffled data into test and train sets, with the test set taking the first test_set_size elements and the train set taking the rest
    test_data = data_shuffled[:test_set_size]
    train_data = data_shuffled[test_set_size:]

    # Return the train and test sets
    return train_data, test_data




