.SILENT:

PROJECTS := $(wildcard */)
OUTPUT := res.csv

# Displays all available rules
help:
	echo "out			- Exports build results in csv format"
	echo "print-all		- Prints build results"
	echo "print proj=[PROJ_DIR]	- Prints build results of specified project"

# Outputs build results for all projects to $(OUTPUT)
out:
	> res.csv
	echo "Project Name, Pass/Fail" >> $(OUTPUT)
	for proj in $(PROJECTS); do \
		dotnet build $$proj -v q > /dev/null 2>&1; \
		if [ $$? -eq 0 ]; then \
			echo "$$proj, Pass" >> $(OUTPUT); \
		else \
			echo "$$proj, Fail" >> $(OUTPUT); \
		fi \
	done

# Prints build results for all projects
print-all:
	for proj in $(PROJECTS); do \
		$(MAKE) print proj=$$proj --no-print-directory; \
	done

#Prints build results for specific project
print:
	dotnet build $$proj -v q > /dev/null 2>&1; \
	if [ $$? -eq 0 ]; then \
		echo "$$proj Build success! :D"; \
	else \
		echo "$$proj Build fail :("; \
	fi \