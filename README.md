<!DOCTYPE html>
<html>
<head>
    <title>SQL Practice Repository</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h1, h2, h3 { color: #333; }
        code { background: #f4f4f4; padding: 2px 4px; border-radius: 4px; }
        pre { background: #f4f4f4; padding: 10px; border-radius: 4px; overflow-x: auto; }
    </style>
</head>
<body>
    <h1>SQL Practice Repository</h1>
    
    <h2>Introduction</h2>
    <p>Welcome to my SQL Practice Repository! This is a space where I document and share SQL scripts and exercises that cover both beginner and intermediate-level concepts. Whether you're just getting started or looking to enhance your skills, this repository provides hands-on examples to help you learn SQL in a practical way.</p>
    
    <h2>Topics Covered</h2>
    
    <h3>Beginner Level</h3>
    <ul>
        <li><strong>Creating Tables:</strong> Learn how to define table structures using <code>CREATE TABLE</code>, specify data types, and set constraints like <code>PRIMARY KEY</code> and <code>FOREIGN KEY</code>.</li>
        <li><strong>SELECT Statements:</strong> Fetch data from tables using <code>SELECT</code>, choose specific columns, and apply expressions.</li>
        <li><strong>WHERE Clause:</strong> Filter results using conditions with operators like <code>=</code>, <code>&gt;</code>, <code>&lt;</code>, <code>AND</code>, <code>OR</code>, and <code>NOT</code>.</li>
        <li><strong>LIKE Operator:</strong> Use wildcard matching (<code>%</code>, <code>_</code>) to find patterns.</li>
        <li><strong>GROUP BY Clause:</strong> Group rows based on column values and apply aggregate functions like <code>COUNT()</code>, <code>SUM()</code>, <code>AVG()</code>, <code>MIN()</code>, and <code>MAX()</code>.</li>
        <li><strong>ORDER BY Clause:</strong> Sort query results using <code>ASC</code> or <code>DESC</code>.</li>
        <li><strong>HAVING Clause:</strong> Apply conditions on grouped results.</li>
        <li><strong>LIMIT Clause:</strong> Control how many rows are returned.</li>
        <li><strong>Aliasing:</strong> Use <code>AS</code> to rename columns or tables.</li>
    </ul>
    
    <h3>Intermediate Level</h3>
    <ul>
        <li><strong>CASE Statements:</strong> Introduce conditional logic inside queries.</li>
        <li><strong>Joins:</strong> Combine data from multiple tables:
            <ul>
                <li><code>INNER JOIN</code>: Retrieves matching records.</li>
                <li><code>LEFT JOIN</code>: Returns all records from the left table.</li>
                <li><code>RIGHT JOIN</code>: Returns all records from the right table.</li>
                <li><code>FULL JOIN</code>: Retrieves all records from both tables.</li>
            </ul>
        </li>
        <li><strong>Subqueries:</strong> Use queries within queries.</li>
        <li><strong>Window Functions:</strong> Perform calculations across rows:
            <ul>
                <li><code>ROW_NUMBER()</code>: Assigns a unique number to each row.</li>
                <li><code>RANK()</code> and <code>DENSE_RANK()</code>: Assigns rank values.</li>
                <li><code>LAG()</code> and <code>LEAD()</code>: Access previous or next row values.</li>
            </ul>
        </li>
        <li><strong>String Functions:</strong> Work with text data using <code>CONCAT()</code>, <code>SUBSTRING()</code>, <code>TRIM()</code>, <code>UPPER()</code>, and <code>LOWER()</code>.</li>
        <li><strong>Unions:</strong> Combine results from multiple queries:
            <ul>
                <li><code>UNION</code>: Merges distinct records.</li>
                <li><code>UNION ALL</code>: Merges all records, including duplicates.</li>
            </ul>
        </li>
    </ul>
    
    
