import requests
from urllib.parse import urljoin
from bs4 import BeautifulSoup

def is_dead_link(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            return False
        else:
            return True
    except requests.RequestException:
        return True

def find_dead_links(base_url):
    visited = set()
    dead_links = set()

    def crawl(url):
        if url in visited:
            return
        visited.add(url)
        try:
            response = requests.get(url)
            if response.status_code == 200:
                soup = BeautifulSoup(response.content, 'html.parser')
                for link in soup.find_all('a', href=True):
                    href = link['href']
                    print('checking : ', href)
                    if not href.startswith('http'):
                        href = urljoin(base_url, href)
                    if href not in visited:
                        if is_dead_link(href):
                            dead_links.add(href)
                        else:
                            crawl(href)
        except requests.RequestException:
            dead_links.add(url)

    crawl(base_url)
    return dead_links

# Replace this URL with the one you want to check
base_url = "https://informatievlaanderen.github.io/VSDS-onboarding-docs/"
dead_links = find_dead_links(base_url)

for link in dead_links:
    print(f"Dead link found: {link}")
