

create_train_test_sets <- function(features, target, test_size = 0.2, random_state = NULL) {
  # This function splits the input data into training and testing sets,
  # with the ability to specify the size of the test set and an optional
  # random seed for reproducibility. The function uses R's random
  # number generator to shuffle the data and split it into two sets,
  # ensuring that the data is randomized during the splitting process.
  #
  # Arguments:
  #   features (list or array-like): The features data to be split into training and testing sets.
  #   target (list or array-like): The target data to be split into training and testing sets.
  #   test_size (float, optional): The proportion of the data to be included in the test set. Defaults to 0.2.
  #   random_state (int, optional): An optional random seed to set for reproducibility. Defaults to NULL.
  #
  # Returns:
  #   train_features (list or array-like): The training features subset.
  #   test_features (list or array-like): The testing features subset.  
  #   train_target (list or array-like): The training target subset.
  #   test_target (list or array-like): The testing target subset.
  
  if (!is.null(random_state)) {
    set.seed(random_state)
  }
  
  # Determine the number of observations based on features
  num_observations <- nrow(features) # Assumes features is a matrix or dataframe
  
  # Ensure that the target length matches the number of feature observations
  if (length(target) != num_observations) {
    stop("The length of the target does not match the number of observations in features.")
  }
  
  # Shuffle indices
  shuffled_indices <- sample(seq_len(num_observations))
  
  # Apply shuffled indices to features and target
  features_shuffled <- features[shuffled_indices, ]
  target_shuffled <- target[shuffled_indices]
  
  # Calculate the size of the test set
  test_set_size <- floor(test_size * num_observations)
  
  # Split features
  test_features <- features_shuffled[1:test_set_size, ]
  train_features <- features_shuffled[(test_set_size + 1):num_observations, ]
  
  # Split target
  test_target <- target_shuffled[1:test_set_size]
  train_target <- target_shuffled[(test_set_size + 1):num_observations]
  
  list(train_features = train_features, test_features = test_features,
       train_target = train_target, test_target = test_target)
}





create_train_test_set <- function(data, test_size = 0.2, random_state = NULL) {
  # This function splits the input data into training and testing sets,
  # with the ability to specify the size of the test set and an optional
  # random seed for reproducibility. The function uses R's random
  # number generator to shuffle the data and split it into two sets,
  # ensuring that the data is randomized during the splitting process.
  #
  # Arguments:
  #   data (list or array-like): The data to be split into training and testing sets.
  #   test_size (float, optional): The proportion of the data to be included in the test set. Defaults to 0.2.
  #   random_state (int, optional): An optional random seed to set for reproducibility. Defaults to NULL.
  #
  # Returns:
  #   train_data (list or array-like): The training data subset.
  #   test_data (list or array-like): The testing data subset.
  
  # If a random seed is provided, set the seed in R's random number generator
  if (!is.null(random_state)) {
    set.seed(random_state)
  }
  
  # Create a shuffled index array using R's sample function
  shuffled_indices <- sample(seq_len(length(data)), replace = FALSE)
  
  # Shuffle the data based on the shuffled indices
  data_shuffled <- data[shuffled_indices]
  
  # Calculate the size of the test set based on the test_size parameter and the total size of the data
  test_set_size <- floor(test_size * length(data))
  
  # Split the shuffled data into test and train sets, with the test set taking the first test_set_size elements and the train set taking the rest
  test_data <- data_shuffled[1:test_set_size]
  train_data <- data_shuffled[(test_set_size + 1):length(data)]
  
  # Return the train and test sets as a list
  return(list(train_data = train_data, test_data = test_data))
}