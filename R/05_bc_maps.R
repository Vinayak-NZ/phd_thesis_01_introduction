## ---- bc-tpb

tpb_graphviz <- grViz("digraph{
         
                     graph[rankdir = LR]
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#4739a2', 
                     fontcolor = '#ffffff']  
                     A[label = 'Intention']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#000000', 
                     fontcolor = '#ffffff']  
                     B[label = 'Behaviour']
                     
                     edge[color = black]
                     A -> B
                     
                     }")

tpb_graphviz

## ---- bc-hapa

hapa_graphviz <- grViz("digraph{
         
                     graph[rankdir = LR]
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#46e7fd', 
                     fontcolor = '#ffffff']  
                     A[label = 'Intention']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#4739a2', 
                     fontcolor = '#ffffff']  
                     B[label = 'Planning']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#000000', 
                     fontcolor = '#ffffff']  
                     C[label = 'Behaviour']
                     
                     edge[color = black]
                     A -> B -> C
                     
                     }")

hapa_graphviz
