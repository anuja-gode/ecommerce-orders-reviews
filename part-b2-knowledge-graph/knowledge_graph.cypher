// Graph Creation Query
// Create customers
CREATE (a:Customer {name: 'Customer A'})
CREATE (b:Customer {name: 'Customer B'})

// Create products
CREATE (l:Product {name: 'Laptop'})
CREATE (m:Product {name: 'Mobile'})
CREATE (h:Product {name: 'Headphones'})

// Create categories
CREATE (e:Category {name: 'Electronics'})
CREATE (f:Category {name: 'Accessories'})

// Create reviews
CREATE (r1:Review {
    sentiment: 'negative',
    text: 'Battery died in a week'
})

CREATE (r2:Review {
    sentiment: 'positive',
    text: 'Excellent product'
})

// Create purchase relationships
CREATE (a)-[:PURCHASED]->(l)
CREATE (a)-[:PURCHASED]->(m)
CREATE (b)-[:PURCHASED]->(h)

// Connect products to categories
CREATE (l)-[:BELONGS_TO]->(e)
CREATE (m)-[:BELONGS_TO]->(e)
CREATE (h)-[:BELONGS_TO]->(f)

// Connect customers to reviews
CREATE (a)-[:WROTE]->(r1)
CREATE (b)-[:WROTE]->(r2)

// Connect reviews to products
CREATE (r1)-[:REVIEWS]->(l)
CREATE (r2)-[:REVIEWS]->(h)


// Graph Visualization Query
MATCH (n)-[r]->(m)
RETURN n, r, m


// Final Assignment Query
MATCH (c:Customer)-[:WROTE]->(r:Review)
WHERE r.sentiment='negative'
MATCH (c:Customer)-[:PURCHASED]->(p:Product)
RETURN DISTINCT p.name AS Product;
