# Project 2 CMPSC 431W
# CLI inteface 
# Jonathan Ahn

# imports below
import psycopg2
import secrets
from tabulate import tabulate


# code below

#adjust the following information based on your database name and user information
conn = psycopg2.connect(
    host="",
    database="",
    user="",
    password=""
)


cursor = conn.cursor()



def generate_id():
    alphabet = "0123456789abcdef"
    id = ''.join(secrets.choice(alphabet) for _ in range(32))
    return id


#user pressed 1
def new_customer():
    print("----------------------------------------------------------------")
    print("Let's add a new customer...")
    #create a new and unique customer_id
    id_valid = False
    while id_valid == False:
        new_id = generate_id()
        cursor.execute("SELECT * FROM customers WHERE customer_id = %s", (new_id,))
        rows = (cursor.fetchall())
        if (rows == []):
            id_valid = True
        
    #get paramaters for customer creation, error handle    
    print("New customer id created: " + new_id)

    #making sure that zipcode is an int and has length 4 or 5
    zipcode = input("Please enter the customer's zipcode:   ")
    zip_valid = False
    while zip_valid == False:
        try:
            int(zipcode)
        except:
            zipcode = input("Invalid input, please enter a valid zipcode:   ")
        else:
            if(len(zipcode) == 4 or len(zipcode) == 5):
                zip_valid = True
                zipcode = int(zipcode)
            else:
                zipcode = input("Invalid input, please enter a valid zipcode:   ")

    #making sure that city is not an int
    city = input("Please enter the customer's city:   ")
    city_valid = False
    while city_valid == False:
        try:
            int(city)
        except:
            if (len(city) < 25):
                city_valid = True
            else:
                city = input("Input was too large, please enter a valid city:   ")
        else:
            city = input("Invalid input, please enter a valid city:   ")
    
    #making sure state is not an int
    state = input("Please enter the customer's state:   ")
    state_valid = False
    while state_valid == False:
        try: 
            int(state)
        except:
            if (len(state) < 25):
                state_valid = True
            else:
                state = input("Input was too large, please enter a valid state:   ")
        else:    
            state = input("Invalid input, please enter a valid state:   ")

    cursor.execute("INSERT INTO customers VALUES (%s,%s,%s,%s);", (new_id, zipcode, city, state))
    conn.commit()

    customer_header = ['customer_id', 'customer_zipcode','customer_city','customer_state']
    cursor.execute("SELECT * FROM customers WHERE customer_id=%s;", (new_id,))
    data = cursor.fetchall()
    print(tabulate(data, headers=customer_header, tablefmt="grid"))

    return

def remove_review(review_id):
    cursor.execute("BEGIN;")
    cursor.execute("SELECT * FROM reviews WHERE review_id=%s;", (review_id,))   
    data = cursor.fetchall()       
    cursor.execute("DELETE from reviews WHERE review_id=%s;", (review_id,))
    if (data == []):
        cursor.execute("ROLLBACK;")
        review_id = input("Invalid review id, please try again:   ")
        remove_review(review_id)
    else:       
        cursor.execute("COMMIT;")  
        review_columns = ['review_id','order_id','review_score','review_creation_date']
        print(tabulate(data, headers=review_columns, tablefmt="grid"))
        return

def update_status():

    valid_status = False
    order_id = input("Please enter the order id:   ")

    while valid_status == False:
        try: 
            cursor.execute("SELECT * FROM orders WHERE order_id=%s;", (order_id,))
        except:
            order_id = input("Invalid order id, please try again:   ")
        else:
            order_fetch = cursor.fetchall()
            if order_fetch != []:
                valid_status = True
            else:
                order_id = input("Invalid order id, please try again:   ")

    order_status = order_fetch[0][2]
    if (order_status == "delivered"):
        d = input("Order has already been delivered, would you like to cancel the order or exit? [C or E]:   ").lower() 
        valid_d = False
        while valid_d == False:
            if (d == "c"):
                new_order_status = "canceled"
                valid_d = True
            elif (d == "e"):
                valid_d = True
                print("Exiting...")
                print("----------------------------------------------------------------")
                return 
            else:
                d = input("Invalid input, type C to make status canceled or E to exit:   ")

    elif (order_status == "shipped"):
        s = input("Order has been shipped, would you like to cancel the order or update it to delivered? [C or D or E]:   ").lower()
        valid_s = False
        while valid_s == False:
            if (s == "c"):
                new_order_status = "canceled"
                valid_s = True
            elif (s == "d"):
                new_order_status = "delivered"
                valid_s = True
            elif (s == "e"):
                valid_s = True
                print("Exiting...")
                print("----------------------------------------------------------------")
                return 
            else:
                s = input("Invalid input, type C to make status canceled or D to make status Delivered or E to exit:   ")

    elif (order_status == "canceled"):
        c = input("Order has been canceled, would you like to update a new order id status or exit? [N or E]:   ").lower() 
        valid_c = False
        while valid_c == False:
            if (c == "n"):
                valid_c = True
                update_status()
                return 
            elif (c == "e"):
                valid_c = True
                print("Exiting...")
                print("----------------------------------------------------------------")
                return 
            else:
                c = input("Invalid input, type N to try a new order id or E to exit:   ")
    cursor.execute("UPDATE orders SET order_state=%s WHERE order_id=%s", (new_order_status, order_id, ))
    conn.commit()
    print("Order status successfully updated")
    print("----------------------------------------------------------------")
    return

def largest_order_price():
    cursor.execute("SELECT * FROM orderdetails WHERE price IN (SELECT max(price) FROM orderdetails)")
    data = cursor.fetchall()
    order_details_header = ["order_id", "product_id", "seller_id", "shipping_date", "price", "freight_value"]
    print(tabulate(data, headers=order_details_header, tablefmt="grid"))
    return

def sorted_review_score():
    cursor.execute("SELECT review_id,orderdetails.order_id,review_score,price " + 
                   "FROM orderdetails JOIN reviews on orderdetails.order_id = reviews.order_id " +
                   "ORDER BY review_score")
    data = cursor.fetchall()
    data_header = ["review_id","order_id","review_score","order_price"]
    print(tabulate(data,headers=data_header,tablefmt="grid"))
    return

def product_count():
    cursor.execute("SELECT product_category_name, count(*) FROM products GROUP BY product_category_name")
    data = cursor.fetchall()
    data_header = ['product_category_name','product_count']
    print(tabulate(data,headers=data_header,tablefmt="grid"))
    return

def order_info():
    print("----------------------------------------------------------------")
    print("1. Display the order with largest price")
    print("2. Display orders based on review scores")
    print("3. Display amount of products in each category")
    inp = (input("Select operation 1-3:   "))
    valid_input = False
    while valid_input == False:
        try:
            int(inp)
        except:
            inp = (input("Invalid input, please choose a number from 1-3:   "))
        else:
            if (int(inp) == 1):
                largest_order_price()
                valid_input = True
            elif (int(inp) == 2):
                sorted_review_score()
                valid_input = True
            elif (int(inp) == 3):
                product_count()
                valid_input = True
            else:
                inp = (input("Invalid input, please choose a number from 1-3:   "))
    return
    

def initial_prompt(inp):
    valid_input = False
    while valid_input == False:
        try: 
            int(inp)
        except:
            inp = (input("Invalid input, please choose a number from 1-5:   "))
        else:
            if (int(inp) == 1):
                new_customer()
                print("Customer successfully added")
                print("----------------------------------------------------------------")
                valid_input = True
            elif (int(inp) == 2):
                print("----------------------------------------------------------------")
                print("Let's remove a review...")
                review_id = input("Please enter the review id:   ")
                remove_review(review_id)
                print("Review successfully removed")
                print("----------------------------------------------------------------")
                valid_input = True
            elif (int(inp) == 3):
                print("----------------------------------------------------------------")
                print("Let's update an order status...")
                update_status()
                
                valid_input = True
            elif (int(inp) == 4):
                order_info()
                print("Information successfully displayed")
                print("----------------------------------------------------------------")
                valid_input = True
            elif (int(inp) == 5):
                print("Exiting...")
                valid_input = True
                return
            else:
                inp = (input("Invalid input, please choose a number from 1-5:   "))
                    
        conn.close()


print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("Welcome to the E-Commerce Database CLI Interface")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("1. Add a new customer")
print("2. Remove a review")
print("3. Update order status")
print("4. Order information")
print("5. Exit")
inp = (input("Select operation 1-5:   "))
initial_prompt(inp)
