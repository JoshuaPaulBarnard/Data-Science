import random
import numpy as np
import json

def generate_data_point(start_id, end_id):
    """
    This function generates a list of data points, each representing a customer's information.
    
    Args:
        start_id (int): The starting ID for the generated data points.
        end_id (int): The ending ID for the generated data points.
    
    Returns:
        list: A list of data points, each represented as a dictionary.
    """
    data_points = []
    for id in range(start_id, end_id+1):
        # Randomly choose the plan type (basic or premium)
        plan_type = random.choice(["basic", "premium"])
        
        # Set the monthly charges based on the plan type
        monthly_charges = 49.99 if plan_type == "basic" else 99.99
        
        # Randomly choose the gender
        gender = random.choice(["male", "female"])
        
        # Simulate frequency of use based on gender
        if gender == "male":
            frequency_of_use = np.random.normal(25, 6)
        elif gender == "female":
            frequency_of_use = np.random.normal(23, 4)

        frequency_of_use = round(frequency_of_use)  # Round the frequency of use to the nearest integer
        
        # Simulate usage time based on gender
        if gender == "male":
            usage_time = np.random.normal(7.5, 1.8)
        else:
            usage_time = np.random.normal(10, 2)
        
        # Randomly choose the age
        age = random.randint(18, 80)
        
        # Simulate number of calls based on age
        number_of_calls = int( np.random.normal(age * 0.1, 2) )
        if number_of_calls < 0:
            number_of_calls = 0
        
        # Simulate satisfaction rating based on number of calls
        satisfaction_rating = np.random.normal(5 - number_of_calls, 2)
        satisfaction_rating = round(satisfaction_rating)    # Round the satisfaction rating to the nearest integer
        satisfaction_rating = max(1, min(10, satisfaction_rating))  # Ensure the satisfaction rating is between 1 and 10

        # Simulate churn based on satisfaction rating
        churn = random.random() < (satisfaction_rating / 10)
        
        # Create a data point dictionary
        data_point = {
            "id": id,  # Unique ID for the customer
            "age": age,  # Random age between 18 and 65
            "gender": gender,  # Random gender (male or female)
            "usage_patterns": {
                "frequency_of_use": frequency_of_use,  # Simulated frequency of use
                "usage_time": usage_time  # Simulated usage time
            },
            "customer_service_interactions": {
                "number_of_calls": number_of_calls,  # Simulated number of calls based on age
                "satisfaction_ratings": satisfaction_rating  # Simulated satisfaction rating based on number of calls
            },
            "billing_information": {
                "plan_type": plan_type,  # The randomly chosen plan type
                "monthly_charges": monthly_charges  # The corresponding monthly charges
            },
            "churned": churn
        }
        
        # Append the data point to the list
        data_points.append(data_point)
    
    # Return the list of data points
    return data_points


if __name__ == "__main__":
    start_id = 1
    end_id = 2000
    data_points = generate_data_point(start_id, end_id)
    # Write the data to a JSON file
    file_path = 'B:/Documents/DataAnnotation/data.json'
    with open(file_path, 'w') as f:
        # Write the JSON dataset to the file
        json.dump(data_points, f, indent=4)
    print("JSON dataset written to 'data.json' successfully!")