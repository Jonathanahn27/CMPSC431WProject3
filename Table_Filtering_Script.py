import pandas as pd
import os

os.chdir('OneDrive/Desktop/School/CMPSC 431W')


# Load data from CSV files
customers_df = pd.read_csv("allcustomers.csv")
wanted_customerids_df = pd.read_csv("wantedcustomers.csv")

# Merge order_reviews and wantedorderids on orderid column
merged_df = pd.merge(customers_df, wanted_customerids_df, how='inner', left_on='customer_id', right_on='wantedcustomers')

# Drop the unwantedorderids column
merged_df.drop('wantedcustomers', axis=1, inplace=True)

# Save the filtered data back to CSV
merged_df.to_csv("filteredcustomers.csv", index=False)


