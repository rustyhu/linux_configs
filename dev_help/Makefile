### Handy makefile automatic variables
### https://makefiletutorial.com/#automatic-variables
#
# the target name
#echo $@
#
# Outputs all prerequisites newer than the target
#echo $?
#
# Outputs all prerequisites
#echo $^
#
# As a general tool template for file timestamp tracing, using these autovars
# should be enough.

# Extra build options
CPOPT = --std=c++11
INCLUDE = -Iinclude
LINKFLAG = -L. -lpthread

target_name : simple_one.cc
	g++ $(CPOPT) $^ -o $@ $(INCLUDE) $(LINKFLAG)
