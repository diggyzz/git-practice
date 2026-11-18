# Generic single-directory C++ project
CXX      := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -g
SAN      := -fsanitize=address,undefined
SRC      := $(wildcard *.cpp)
OBJ      := $(SRC:.cpp=.o)
TARGET   := main

.PHONY: all run debug clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $@

run: all
	./$(TARGET)

debug:
	$(CXX) $(CXXFLAGS) $(SAN) $(SRC) -o $(TARGET)-debug
	./$(TARGET)-debug

clean:
	rm -f $(TARGET) $(TARGET)-debug $(OBJ)
