from app import app


def test_home():
    client = app.test_client()
    response = client.get("/")
    
    assert response.status_code == 200
    assert response.data == b"DevOps Demo App"


def test_health():
    client = app.test_client()
    response = client.get("/health")
    
    assert response.status_code == 200
    assert response.json["status"] == "healthy"


def test_version():
    client = app.test_client()
    response = client.get("/version")

    assert response.status_code == 200
    assert response.json["version"] == "1.0.0"
    assert response.json["application"] == "DevOps Demo"