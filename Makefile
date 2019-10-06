SPIKE_BUILD_DIR     = utils/spike/build
SPIKE_DEFAULT_ARCH ?= RV64IMAFDBC

   # assume $RISCV is set in shell
RV_PREFIX          ?= ${RISCV}

TEST_DIR            = utils/tests

.PHONY: all
all: rv-tests spike

.PHONY: submodules
submodules:
	@if git submodule status | egrep -q '^[-]|^[+]' ; then \
	    git submodule update --init --recursive; \
	fi

.PHONY: rv-tests
rv-tests: submodules
	$(MAKE) -C $(TEST_DIR)/isa -j${nproc}

$(SPIKE_BUILD_DIR): submodules
	@mkdir -p $@

spike: $(SPIKE_BUILD_DIR)
	@cd $(SPIKE_BUILD_DIR) && ../configure --prefix=$(RV_PREFIX) --with-isa=$(SPIKE_DEFAULT_ARCH) && make
	@cp $(SPIKE_BUILD_DIR)/spike .

.PHONY: clean
clean:
	@rm -rf spike $(SPIKE_BUILD_DIR)
	$(MAKE) -C $(TEST_DIR)/isa clean
