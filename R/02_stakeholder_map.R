## ---- hc-system-stakeholders

# Create the nodes
nodes <- create_node_df(
  n = 6, 
  label = c("Delivery of care \nin Germany", 
            "Federal \nGovernment", 
            "State \nGovernments", 
            "Healthcare \nproviders", 
            "Insurance \nproviders", 
            "Patient \ngroups"),
  shape = "circle",
  width = 1.2,
  height = 1, 
  fillcolor = c("#000000", 
                "#4739a2", 
                "#46e7fd", 
                "#fefe62", 
                "#e18b22", 
                "#d35fb7"), 
  fontcolor = c(rep("#ffffff", 2), 
                rep("#000000", 4))
)

# Create the edges
edges <- create_edge_df(
  from = c(2, 3, 4, 5, 6),
  to = c(1, 1, 1, 1, 1),
  rel = "connected"
)

# Create the graph
graph <- create_graph(nodes_df = nodes, 
                      edges_df = edges)

# Render the graph
render_graph(graph)


