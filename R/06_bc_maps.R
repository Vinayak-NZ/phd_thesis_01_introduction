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

## ---- bc-tpb

com_b_graphviz <- grViz("digraph{
         
                     graph[rankdir = LR]
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#e18b22', 
                     fontcolor = '#ffffff']  
                     A[label = 'Capability']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#fefe62', 
                     fontcolor = '#000000']  
                     B[label = 'Opportunity']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#4739a2', 
                     fontcolor = '#ffffff']  
                     C[label = 'Motivation']
                     
                     node[shape = rectangle, 
                     style = filled, 
                     fillcolor = '#000000', 
                     fontcolor = '#ffffff']  
                     D[label = 'Behaviour']
                     
                     edge[color = black]
                     A -> D
                     B -> D
                     C -> D
                     
                     }")

com_b_graphviz