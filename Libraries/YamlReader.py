import yaml


class YamlReader:

    def load_yaml(self, file_path):
        with open(file_path, "r") as file:
            return yaml.safe_load(file)