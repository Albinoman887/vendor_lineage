# Copyright (C) 2022 PixysOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# BetaDroid OTA update package

LINEAGE_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/$(LINEAGE_VERSION)-fastboot.zip
ECHO_BLUE := \e[34m
ECHO_GREEN := \e[32m
ECHO_ENDCOLOR := \e[0m

.PHONY: updatepackage
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(LINEAGE_TARGET_UPDATEPACKAGE)
#	@echo "Generating device.json for OTA Updater..."
#	$(hide) ./vendor/lineage/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) $(LINEAGE_VERSION)-fastboot.zip
	@echo "Generating changelog..."
	$(hide) ./vendor/lineage/build/tools/changelog.sh $(LINEAGE_BUILD)
	$(hide) ./vendor/lineage/build/tasks/betadroid_ascii.sh
	@echo -e "$(ECHO_GREEN)==============================================================${ECHO_ENDCOLOR}"
	@echo -e " ${ECHO_BLUE}update package is:${ECHO_ENDCOLOR} $(LINEAGE_VERSION)-fastboot.zip"
	@echo -e " ${ECHO_BLUE}changelog is:${ECHO_ENDCOLOR} $(LINEAGE_VERSION)-changelog.txt"
	@echo -e "${ECHO_GREEN}==============================================================${ECHO_ENDCOLOR}"
	@echo ""
