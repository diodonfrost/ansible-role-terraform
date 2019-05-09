"""Sort complex versions"""

from distutils.version import LooseVersion


def filter_sort_versions(value):
    """
        Ansible entrypoint function
    """
    return sorted(value, key=LooseVersion)


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
