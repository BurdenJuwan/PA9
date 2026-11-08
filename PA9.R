# PA9
# Juwan Burden
# 11/08/26
# R script for Vehicle Fuel Efficiency Prediction Model

# Plot the Data
plot(mtcars$wt, mtcars$mpg,
     main = "Vehicle Weight vs. Fuel Efficiency",
     xlab = "Weight (1,000 lbs)",
     ylab = "Fuel Efficiency (MPG)",
     pch = 19, col = "darkblue", las = 1)

# Fit a Linear Regression Model
model <- lm(mpg ~ wt, data = mtcars)

# Add the Fitted Regression Line
abline(model, col = "red", lwd = 2)

# Interpretation of the Slope
summary(model)
confint(model)
slope <- summary(model)$coefficients[2, 1]
p_value <- summary(model)$coefficients[2, 4]
confintA <- confint(model)[2,1]
confintB <- confint(model)[2,2]
cat("Slope Estimate: ", slope)
cat("p-value: ", p_value)
cat("95% Confidence Interval for Slope: ",confintA,confintB)
cat("The slope is statistically significant at the 0.05 level, indicating
a significant relationship between weight and fuel efficiency.")

# The estimated slope of the regression line is -5.3445.
# For every additional 1,000 lbs a vehicle weighs, 
# it's fuel efficiency decrease by approximately 5.34 miles per gallon (MPG).
# The p-value for the wt variable is below the standard threshold of 0.05.
# We can conclude that weight has a reliable, negative impact on MPG.

# Predict MPG for a Given Vehicle Weight 
new_car <- data.frame(wt = 6)
prediction <- predict(model, newdata = new_car, interval = "prediction", level = 0.95)

# Print the Prediction
cat("Predicted MPG for a 6,000-pound vehicle:")
print(prediction)
# A 6,000-pound vehicle falls outside the range of the observed data.
# A vehicle cannot have negative MPG.
cat("Note: The weight value is outside the range of the dataset, which 
limits the accuracy of the prediction. Use caution when interpreting 
this result.")
