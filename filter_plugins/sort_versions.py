"""Sort complex versions"""

import re


def _version_key(version_string):
    """Convert a version string to a tuple of integers for comparison."""
    return [int(x) for x in re.findall(r'\d+', version_string)]


def filter_sort_versions(value):
    """
        Ansible entrypoint function
    """
    return sorted(value, key=_version_key)


class FilterModule(object):
    """
        Sort complex versions like 0.10.2, 0.1.1, 0.10.12
    """
    filter_sort = {
        'sort_versions': filter_sort_versions,
    }

    def filters(self):
        """
            Return the sorted values
        """
        return self.filter_sort
