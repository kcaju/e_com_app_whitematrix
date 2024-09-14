
# E Commerce App

The e-commerce app provides a user-friendly platform for browsing and purchasing products, featuring secure checkout. It’s designed to deliver a smooth shopping experience with robust performance and ease of use.The project was completed using the Provider and Hive packages to manage state and local storage in the application.

The app starts with a login page that asks for phone number. if it's a  10 digit number page navigate to OTP screen. OTP screen asks to enter any 6 digits and verify button takes to Home screen. Login functionality is done with shared preference package.That is,when logged in user restarts the app,it directly takes to homescreen(without scratch card).

When user enters home screen ,a scratch card is popped up with a radom product.When add to cart button is clicked that product is added to cart  at 0 rupees. In the cart screen when proceed to checkout button is clicked the app opens razor pay site for payment process.

The Home screen of app shows few newly arrived products they are given in carousel slider and 20 dummy products that app sells (given in gridview builder).when each product card is clicked  details of that product is shown & we can add this product to cart using the add to cart button .There is a drawer option on the appbar.The logout option takes back to login screen.

Cart screen shows added products with their name, price and image. There is options to increase or decrease the product quantity.Also given a remove button to remove the product from cart.At the bottom of this screen ,there is container which shows the total amount of all the products added to cart and a proceed to checkout button that navigates to razorpay for payment process.
