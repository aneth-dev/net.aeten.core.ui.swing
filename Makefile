SOURCE_VERSION = 1.7
JFLAGS ?= -g:source,lines,vars -encoding utf8
TOUCH_DIR = .touch


all: compile jar eclipse src test

# Sources
SRC = ui.swing
src: $(SRC)
ui.swing:: ui.graphical

# COTS
COTS = ui.graphical
cots: $(COTS)
ui.graphical::

#Test
TEST = ui.swing.test
test:: $(TEST)
ui.swing.test:: ui.swing ui.graphical

clean:
	$(RM) -rf $(BUILD_DIR) $(DIST_DIR) $(GENERATED_DIR) $(TOUCH_DIR)

SRC_DIRS = src/ test/
MODULES = $(SRC) $(COTS) $(TEST)
include Java-make/java.mk

