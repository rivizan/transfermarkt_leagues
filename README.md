README
================

# Transfer Markt scraping with R

This small project collects football data from Transfer Markt and saves it in the `data` folder. Today it is only getting information from the teams that play on the American continent, but more will be added in the near future.

The `data.csv` contains the result of the process. The information of each column is presented in the following trable:

| Variable    | Class | Description                 |
|-------------|-------|-----------------------------|
| `Country`   | `chr` | Country of the team         |
| `League`    | `chr` | League                      |
| `Club`      | `chr` | Oficial name of the club    |
| `Name`      | `chr` | Short name of the club      |
| `Squad`     | `int` | Number of players           |
| `XAge`      | `num` | Average age of players      |
| `Foreigners`| `num` | Number of foreign players   |
| `MV`        | `chr` | Market Value of the club    |
| `XMV`       | `chr` | Average player Market Value |