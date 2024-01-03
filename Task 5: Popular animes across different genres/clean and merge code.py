import pandas as pd
import string

#1
df = pd.read_csv('4.csv')  


def clean_title(title):
    if isinstance(title, str):
      
        general_replacements = {'Ã': 'A', '©️': 'C'} 
        for key, value in general_replacements.items():
            title = title.replace(key, value)

        title = title.replace('_', ' ')
        title = ''.join(char if char.isalnum() or char.isspace() else '' for char in title)
        title = title.lower()
    return title

df['title'] = df['title'].apply(clean_title)
df.to_excel('999.xlsx', index=False)


#2
import re

df = pd.read_excel('999.xlsx')  
def has_other_characters(title):
    if isinstance(title, str):
        return bool(re.search(r'[^A-Za-z0-9]', title))  
    return False

mask = df['title'].apply(has_other_characters)
result_df = df[mask]
print(result_df)



#3
df1 = pd.read_excel('22.xlsx')  
df2 = pd.read_excel('999.xlsx')

def clean_title(title):
    if isinstance(title, str):
        title = title.lower()
        title = ''.join(char for char in title if char.isalnum() or char.isspace())
    return title

df1['title'] = df1['title'].apply(clean_title)
df2['title'] = df2['title'].apply(clean_title)

merged_df = pd.merge(df1, df2, on='title', how='inner')
merged_df.to_excel('7.xlsx', index=False)