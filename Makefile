
# location of the Python header files
PYTHON_VERSION = 3.6
PYTHON_INCLUDE = /usr/include/python$(PYTHON_VERSION)
# location of the Boost Python include files and library
BOOST_INC = /usr/local/src/boost_1_75_0
BOOST_LIB = /usr/local/src/boost_1_75_0/stage/lib

PYTHON_LIB = /usr/lib/python$(PYTHON_VERSION)/config-3.6m-x86_64-linux-gnu
# compile mesh classes
TARGET = hello_ext
$(TARGET).so: $(TARGET).o
	g++ -shared -Wl,--export-dynamic $(TARGET).o -L$(BOOST_LIB) -lboost_python36 -L$(PYTHON_LIB) -lpython$(PYTHON_VERSION) -o $(TARGET).so
$(TARGET).o: $(TARGET).C
	g++ -I$(PYTHON_INCLUDE) -I$(BOOST_INC) -fPIC -c $(TARGET).C

clean:
	rm -vf $(TARGET).o $(TARGET).so