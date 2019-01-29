Thanks for taking the time to contribute to the SentryOne community. Here, we will give you the lowdown on how to contribute to this project and help SentryOne users to improve the health of their Data Platforms.

This is a living document and will be updated as needed based on feedback and lessons learned as we travel the road of community contirbutions.

# Contributing
Before we start it is important to have read the [Code of Conduct](https://raw.githubusercontent.com/sentryone/advisory-conditions/master/CODE_OF_CONDUCT.md) as all contribtors must adhere to this.

There are a few ways that you can contribute to this community including:
* Creating new Advisory Conditions
* Updating existing Advisory Conditions
* Reporting issues with existing Advisory Conditions
* Fixing issues with Advisory Conditions
* Submitting ideas for new Advisory Conditions

In preperation for contributing it is highly advisable to have a look at our [Current Advisory Conditions](https://my.sentryone.com/advisory-conditions), as well as [Melissa Connors blog post](https://blogs.sentryone.com/melissaconnors/sql-sentry-custom-conditions-logic/) on how the logic works for multi-step Advisory Conditions. This will help when building Advisory Conditions that are more than a single basic check.

## Contribution Process
When contributing new or updating/fixing Advisory Conditions the following process should be followed:
1. Fork the advisory-conditions repository
2. Create a branch based on the Development Branch
3. Publish your branch
4. Create/update the Advisory Condition
5. Commit your Condition to your local repository.
6. Open a PR that has only the Advisory Condition you are adding or updating.
* This should contain only the Advisory Condition you are submitting, dingle file PRs are easier to handle.
* The PR should have the same name as the Advisory Condition.
* The PR should contain information about the what/why this is being submitted, referencing an issue if it is a fix.
7. The submitted PR will be reviewed by the SentryOne team.
8. The PR will be merged if it is good to go or changes will be requested.

# Recommended Practices
When contributing there are a number of different types of Advisory Condition that allow for T-SQL, MDX, performance counters etc. As a general rule of thumb when contributing Advisory Conditions that contain code it should be clear and easy to follow with aliasing where posisble. It is all about making things easy for future us.

## Dos
* Make Advisory Conditions as generic as possible within the bounds of the condition you are checking for.
* Provide details in the Description that explains what you're checking for, why it is desired or not, and any links to additional reading on the subject. It's about helping people learn wnhy something is an issue so that they can learn for the future and prevent issues :-)
* Use common aliases for objects in the SentryOne database or SQL Server system views/tables, if we can standardise in conditions then it's in everyone's best interests.

## Don'ts
* Submit anything that is of a sensitive nature and could be considered an information leak. You might be hard-coding values (server names etc.) for testing in your environment but they should not be there when you commit and push. Remember this is a public repository!
* Create objects in the SentryOne database as this is not a supported configuration presently. If there are enough people who want to do this then that might get it put on the backlogs, please provide feedback via the [SentryOne support community](https://support.sentryone.com/s/).
