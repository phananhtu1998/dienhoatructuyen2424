package middlewares

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
)

var (
	// RequestCounter đếm số lượng request
	RequestCounter = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_total",
			Help: "Total number of HTTP requests.",
		},
		[]string{"path", "method", "status"},
	)

	// RequestDuration đo thời gian xử lý request
	RequestDuration = prometheus.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "http_request_duration_seconds",
			Help:    "HTTP request latencies in seconds.",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"path", "method", "status"},
	)

	// ErrorCounter đếm số lỗi
	ErrorCounter = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_request_errors_total",
			Help: "Total number of HTTP request errors.",
		},
		[]string{"path", "method", "status"},
	)
)

func init() {
	// Đăng ký metrics với Prometheus
	prometheus.MustRegister(RequestCounter)
	prometheus.MustRegister(RequestDuration)
	prometheus.MustRegister(ErrorCounter)
}

// PrometheusMiddleware là middleware ghi nhận các metrics Prometheus
func PrometheusMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path
		method := c.Request.Method

		// Thời gian bắt đầu
		startTime := time.Now()

		// Xử lý request
		c.Next()

		// Thời gian kết thúc và tính duration
		duration := time.Since(startTime).Seconds()

		// Lấy status code
		statusCode := c.Writer.Status()
		statusStr := http.StatusText(statusCode)

		// Tăng counter cho request
		RequestCounter.WithLabelValues(path, method, statusStr).Inc()

		// Ghi nhận thời gian xử lý
		RequestDuration.WithLabelValues(path, method, statusStr).Observe(duration)

		// Nếu có lỗi (status >= 400), tăng ErrorCounter
		if statusCode >= 400 {
			ErrorCounter.WithLabelValues(path, method, statusStr).Inc()
		}
	}
}
