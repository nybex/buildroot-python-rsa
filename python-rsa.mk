#############################################################
#
# python-rsa
#
#############################################################

PYTHON_RSA_VERSION = c17464ffc4fd
PYTHON_RSA_SITE = https://bitbucket.org/sybren/python-rsa/get/
PYTHON_RSA_SOURCE = $(PYTHON_RSA_VERSION).zip
PYTHON_RSA_DEPENDENCIES = python host-python-setuptools

define PYTHON_RSA_BUILD_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_RSA_INSTALL_TARGET_CMDS
	(cd $(@D); \
		PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
		$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
