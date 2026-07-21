CXX      := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -Werror -Iinclude
SRC_DIR  := src
OBJ_DIR  := build
TARGET   := main

SRCS     := $(wildcard $(SRC_DIR)/*.cpp)
OBJS     := $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

.PHONY: all clean checkpoint

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR) $(TARGET)

checkpoint:
	@echo "=== GIT STATUS ==="
	@git status
	@echo "\n=== RECENT COMMITS ==="
	@git log -n 5 --oneline
	@echo "\n=== UNCOMMITTED / MODIFIED DIFF SUMMARY ==="
	@git diff --stat
	@echo "\n=== CURRENT STATUS DOC ==="
	@cat docs/CURRENT_STATUS.md 2>/dev/null || echo "docs/CURRENT_STATUS.md not found"