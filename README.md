# UFC_Fight_Strategy
Code and dashboard for exploring the most important MMA fighting strategies in the UFC.

This is an interactive dashboard which lets a user explore the most effective fighting styles used in the UFC over time.  The dashboard was made with Tableau and can be seen [at this link](https://public.tableau.com/profile/daniel.sola3935#!/vizhome/UFC_strat/Dashboard1).

The data analysis was done in R and utilized [this data set](https://www.kaggle.com/rajeevw/ufcdata) from the "UFC-Fight historical data from 1993 to 2019" Kaggle page.  The original data consisted of each column representing a matchup between two fighters and all the fighting statistics from those fighters.  This was converted to a format where each fighter had their own row and with all their fight statistics and whether or not they won the fight.  From here the [Boruta](https://s3.amazonaws.com/academia.edu.documents/32056178/v36i11.pdf?response-content-disposition=inline%3B%20filename%3DFeature_Selection_with_the_Boruta_Packag.pdf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIATUSBJ6BAPRKCEU7D%2F20200505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200505T224035Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLWVhc3QtMSJHMEUCIQD2Ve7TqGqwWqo1TvYzimDF10A4S8r435YSUPLTQlZPPAIgXWAF5rN9P%2F1ftHsRa3WxyOyofzK%2B5SbwDH5TzItG7zkqvQMIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwyNTAzMTg4MTEyMDAiDKogS5%2FOrRuuUvngMSqRA3VjGqKlLE5RYwaSnWpaJtt6gOlq6tKtKGTtzVlyNrlNmL%2FBUQJ0E3PzF87k3WQ0Yej6RuFB1Yn1exygq0SObfK9yBOljwZQbCfu1sP62jPkqbkv2ciJ8DGQC1KzVBS9qhyCVpmbS%2BsLlZFVEFjc99MY%2FIaZUyV3Aq%2F%2BrhxI6Zp9r5Dp0TPN13fsZpH4gbe0BPgi2ymW89pCIU36iwWG5XC1eXaou%2FEr%2FRCQuSuiPBWk1g6QSYZb8tQ0seJg%2FpYvpaaI26gDsodhwuHe2cF0PwheyZmi%2F1%2FVfnhH59HUZIXMR9meTtVhzlTTyPTsGtYqSa7Qwz1m2tloM01OXcDfMcHayF1wnQlAqB8VtbFdWCUPEDFJ%2FbmcIlkGsqjcb6rPYTj%2FvYnnlhGg2s%2FEIT9Q5F%2Fd87bcBVjIV4lcf7hT%2FWqNjA4xlicVUsAbeZ8r3ZO7LnjCSMcsfC5o0UVgdEbCNiYPuDEPbVElZKCbaTwqRKb6vVMBnAohwNtfqzTGQCwaCQ3L5fropo7S8t1mkswDNmz8MJWrx%2FUFOusBn2FqI7Q6nszaHvTfWpo1Wz6MqySGP5p3Tf4QzuSupFQjIr9YUH3FbXHmxLT3Fj3reiCoy9fKBmqtleczboh3D1B%2BnUZOriMOFZHbQRY5jK3h91hL4kOFIl%2BG54R%2B8bK0SD9TAVakf3Gjf%2Bxhx19NscQEYNa6SrjfpT%2BXRYALVOTrHkrl4kN6KKkRRykRJi%2FlHZZjCZupLh%2BrsSBiYJo3LOG9hZ8pz7O6sSrhwt2BHd0sPsicUOvPVIQStk6s0Ad3vsA4TQrnb9irV%2B%2BkGddn6OKLDXBVFvQFEFZh%2Bt7LQbGgEzedgDy8oUqnLA%3D%3D&X-Amz-Signature=79cc9ca76e6e675c184fb3112e07bdc18f50992f9f94aac58f5d9de49fd09ed8) package was used to determine the most important fighting styles that contribute to a fighter winning a fight.  This method utilizes random forest classifiers and the gini index to determine feature importance.


![alt text](https://github.com/dansola/UFC_Fight_Strategy/blob/master/images/dashboard.png)
