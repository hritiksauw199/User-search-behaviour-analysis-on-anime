import pandas as pd

df = pd.read_csv('cloud.csv')
columns_to_keep = ['score', 'cleaned_text', 'title']
new_df = df[columns_to_keep]

new_df.iloc[87]


import matplotlib.pyplot as plt
from wordcloud import WordCloud

# Your DataFrame
# df = ...

# Get the cleaned text from row 39
text_to_visualize = new_df.loc[87, 'cleaned_text']

# Generate a word cloud
wordcloud = WordCloud(width=800, height=400, background_color='white').generate(text_to_visualize)

# Display the generated word cloud using matplotlib
plt.figure(figsize=(10, 5))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
#plt.title('Word Cloud for Row 39')
plt.show()