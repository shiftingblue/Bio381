# Logic Tree

I'm working to figure out Typora.. 

```mermaid
graph TD
A(Soil Microbial Communities)
G(Soil Microbial Activity)
B(weather)
C(management) 
D(soil physical properties)
E(policy)
F((Soil GHG Emissions))

C ==> A
E --> C
B ==> A 
D --> A
D --> G
B --> C
B --> D
A --> F 
G --> F 
D --> F
 
```

# Heading 1 