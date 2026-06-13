# Robot Framework Hybrid Automation Framework

## Applications

UI:
- SauceDemo

API:
- Reqres

## Features

- UI Automation using Selenium
- API Automation using RequestsLibrary
- Hybrid UI + API Testing
- YAML Driven Test Data
- Page Object Model
- Smoke/Sanity/Regression Suites
- Screenshot Capture on Failure
- Centralized Config Management

## Project Structure

```text
robotframework-hybrid-automation-framework/
│
├── APIs/
├── Pages/
├── Resources/
├── Config/
├── Libraries/
├── TestData/
├── Tests/
├── Results/
│
├── requirements.txt
├── Dockerfile
├── .dockerignore
│
└── README.md
```

## Planned Features

- Robot Framework
- Selenium
- RequestsLibrary
- YAML Data Driven Testing
- Page Object Model
- Smoke/Sanity/Regression
- Selenium Grid
- Pabot Parallel Execution
- Jenkins CI/CD
- Allure Reporting

## Docker Execution

Build Image

```bash
docker build -t robot-framework .
```

Run Tests

```bash
docker run robot-framework
```

Run Regression

```bash
docker run robot-framework robot -i regression Tests
```

## Execution Commands

## Run Smoke

```bash
robot -i smoke Tests
```

## Run Sanity

```bash
robot -i sanity Tests
```

## Run Regression

```bash
robot -i regression Tests
```

## Run Full Framework

```bash
robot -d Results Tests
```

## Generate Better Reports

Create:

```text
Results/
```

Every run:

```bash
robot -d Results Tests
```

Outputs:

```text
Results/
├── report.html
├── log.html
└── output.xml
```

## Tagging Strategy

### Smoke

```robotframework
[Tags]
smoke
sanity
regression
```

### Sanity

```robotframework
[Tags]
sanity
regression
```

### Regression

```robotframework
[Tags]
regression
```

### Example

```robotframework
Valid Login Hybrid

	[Tags]
	smoke
	sanity
	regression
```
